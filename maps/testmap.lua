return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.8.5",
  orientation = "orthogonal",
  renderorder = "left-up",
  width = 34,
  height = 200,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 18,
  nextobjectid = 125,
  properties = {},
  tilesets = {
    {
      name = "testTileset",
      firstgid = 1,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "testTileset.png",
      imagewidth = 256,
      imageheight = 352,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 352,
      tiles = {}
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 14,
      name = "Players",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 111,
          name = "PlayerB",
          type = "",
          shape = "rectangle",
          x = 412,
          y = 3004,
          width = 24,
          height = 24,
          rotation = 0,
          visible = true,
          properties = {
            ["attackKey"] = "kp7",
            ["colorB"] = 0,
            ["colorG"] = 1,
            ["colorR"] = 0,
            ["jumpKey"] = "up",
            ["leftMovementKey"] = "left",
            ["rightMovementKey"] = "right"
          }
        },
        {
          id = 109,
          name = "PlayerA",
          type = "",
          shape = "rectangle",
          x = 100,
          y = 2996,
          width = 24,
          height = 24,
          rotation = 0,
          visible = true,
          properties = {
            ["attackKey"] = "e",
            ["colorB"] = 1,
            ["colorG"] = 0,
            ["colorR"] = 0,
            ["jumpKey"] = "w",
            ["leftMovementKey"] = "a",
            ["rightMovementKey"] = "d"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 12,
      name = "Wall",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 97,
          name = "4",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 2880,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 98,
          name = "3",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 2880,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 94,
          name = "2",
          type = "",
          shape = "rectangle",
          x = -16,
          y = 2256,
          width = 48,
          height = 1184,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "1",
          type = "",
          shape = "rectangle",
          x = 512,
          y = 2256,
          width = 48,
          height = 1184,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 9,
      name = "Ground",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 101,
          name = "2",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 2880,
          width = 352,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 93,
          name = "1",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 3040,
          width = 544,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 17,
      name = "Camera",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 119,
          name = "1",
          type = "",
          shape = "point",
          x = 272,
          y = 2900,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 120,
          name = "2",
          type = "",
          shape = "point",
          x = 268,
          y = 2636,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 122,
          name = "3",
          type = "",
          shape = "point",
          x = 272,
          y = 2780,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 123,
          name = "4",
          type = "",
          shape = "point",
          x = 276,
          y = 2428,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
