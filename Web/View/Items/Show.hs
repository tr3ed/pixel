module Web.View.Items.Show where
import Web.View.Prelude

data ShowView = ShowView { item :: Item }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Item</h1>
        <p>{item}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Items" ItemsAction
                            , breadcrumbText "Show Item"
                            ]