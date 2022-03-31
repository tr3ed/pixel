module Web.View.Items.Order where
import Web.View.Prelude

data OrderView = OrderView { items :: [Item], itemIds :: [Id Item] }

instance View OrderView where
    html OrderView { .. } = [hsx|
        <a href={ItemsAction}>← Zurück zum Menü</a>
        <h1>Bestellung</h1>
        <div class="mb-2 w-100" id="qr" data-items={itemsData}>
            <div class="qr-code w-100"></div>
        </div>
        {itemsDataDisplay}
        <b>{renderPrice total}€</b>

    |]
        where
            renderItem item = [hsx|
                <p>{get #name item} {get #price item}</p>
            |]

            orderedItems = mapMaybe (\id -> find (\i -> get #id i == id) items) itemIds

            groupedItems = mapMaybe getItemCount items
            getItemCount item = case length (filter (\id -> get #id item == id) itemIds) of
                0 -> Nothing
                n -> Just (n, get #name item)

            total = sum $ map (get #price) orderedItems

            itemsData = intercalate ", " (map prettyPrint groupedItems) <> "; Kosten: " <> cs (renderPrice total) <> "€"
            itemsDataDisplay = forEach groupedItems prettyPrintHtml
            prettyPrint (n, name) = show n <> "x " <> name
            prettyPrintHtml x = [hsx|{prettyPrint x}<br>|]