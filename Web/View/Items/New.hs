module Web.View.Items.New where
import Web.View.Prelude

data NewView = NewView { item :: Item }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Item</h1>
        {renderForm item}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Items" ItemsAction
                , breadcrumbText "New Item"
                ]

renderForm :: Item -> Html
renderForm item = formFor item [hsx|
    {(textField #name)}
    {(textField #price)}
    {submitButton}

|]