return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "left-up",
  width = 34,
  height = 60,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 13,
  nextobjectid = 73,
  properties = {},
  tilesets = {
    {
      name = "testTileset",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "testTileset.png",
      imagewidth = 256,
      imageheight = 352,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
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
      id = 12,
      name = "Wall",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 72,
          name = "1",
          class = "",
          shape = "rectangle",
          x = 384,
          y = 496,
          width = 32,
          height = 128,
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
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 68,
          name = "7",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 672,
          width = 64,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 65,
          name = "6",
          class = "",
          shape = "rectangle",
          x = 64,
          y = 576,
          width = 480,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 63,
          name = "5",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 416,
          width = 160,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 64,
          name = "4",
          class = "",
          shape = "rectangle",
          x = 224,
          y = 496,
          width = 192,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "3",
          class = "",
          shape = "rectangle",
          x = 160,
          y = 272,
          width = 160,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "2",
          class = "",
          shape = "rectangle",
          x = 384,
          y = 224,
          width = 160,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "1",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 160,
          width = 160,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
