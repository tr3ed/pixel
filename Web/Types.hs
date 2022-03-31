module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data ItemsController
    = ItemsAction
    | NewItemAction
    | ShowItemAction { itemId :: !(Id Item) }
    | CreateItemAction
    | EditItemAction { itemId :: !(Id Item) }
    | UpdateItemAction { itemId :: !(Id Item) }
    | DeleteItemAction { itemId :: !(Id Item) }
    | OrderAction
    deriving (Eq, Show, Data)
