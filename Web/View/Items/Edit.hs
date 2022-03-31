module Web.View.Items.Edit where
import Web.View.Prelude

data EditView = EditView { item :: Item }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Item</h1>
        {renderForm item}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Items" ItemsAction
                , breadcrumbText "Edit Item"
                ]

renderForm :: Item -> Html
renderForm item = formFor item [hsx|
    {(textField #name)}
    {(textField #price)}
    {submitButton}

|]