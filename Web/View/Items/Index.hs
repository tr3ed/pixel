module Web.View.Items.Index where
import Web.View.Prelude
data IndexView = IndexView { items :: [Item]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <h1>Menü</h1>
        <div>
            {forEach items renderItem}
            <div class="d-flex align-items-center justify-content-between">
                <h3>Warenkorb</h3>
                <a class="btn btn-outline-dark" href="#" onclick="window.location='/'">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000">
                        <path d="M0 0h24v24H0V0z" fill="none"/>
                        <path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM8 9h8v10H8V9zm7.5-5l-1-1h-5l-1 1H5v2h14V4h-3.5z"/>
                    </svg>
                </a>
            </div>
            <div id="basket"></div>
        </div>
        <form action={OrderAction} method="POST" id="order-form">
            <button type="submit" class="btn btn-primary">Bestellen</button>
        </form>
    |]
        where
            renderItem :: Item -> Html
            renderItem item = [hsx|
                <div class="menu-item rounded bg-white shadow mb-2 p-3 d-flex justify-content-between" id={itemId} onclick={"addItem('" <> itemId <> "')"}>
                    <div>{get #name item}</div>
                    <div>{get #price item |> renderPrice}€</div>
                </div>
            |]
                where
                    itemId = show $ get #id item