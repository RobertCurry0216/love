return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 25,
  height = 15,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 8,
  nextobjectid = 47,
  properties = {},
  tilesets = {
    {
      name = "robo_1b_tileset_compact",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "../assets/robo_1b_tileset_compact.png",
      imagewidth = 512,
      imageheight = 256,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      wangsets = {},
      tilecount = 128,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 25,
      height = 15,
      id = 5,
      name = "background",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        25, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 24,
        18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 83, 0, 0, 0, 17,
        18, 0, 0, 10, 0, 79, 0, 0, 0, 0, 0, 79, 77, 78, 0, 0, 65, 98, 102, 98, 116, 0, 8, 0, 19,
        18, 28, 29, 0, 32, 95, 0, 0, 0, 0, 0, 95, 93, 94, 0, 0, 68, 0, 0, 0, 100, 0, 0, 0, 17,
        18, 52, 54, 52, 52, 53, 0, 0, 1, 2, 2, 3, 2, 4, 2, 2, 5, 0, 0, 0, 51, 54, 52, 52, 17,
        20, 0, 0, 83, 0, 0, 0, 0, 21, 22, 22, 22, 22, 22, 22, 22, 23, 0, 0, 0, 0, 0, 0, 0, 17,
        18, 98, 102, 99, 0, 0, 0, 0, 0, 0, 9, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19,
        18, 0, 0, 0, 35, 38, 37, 0, 0, 49, 0, 9, 0, 10, 0, 49, 0, 51, 54, 53, 11, 9, 9, 0, 17,
        20, 0, 0, 0, 0, 60, 0, 0, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 68, 0, 0, 0, 0, 0, 17,
        18, 39, 40, 0, 0, 61, 0, 65, 98, 99, 59, 71, 72, 58, 43, 0, 0, 0, 83, 0, 0, 12, 14, 15, 21,
        23, 55, 56, 0, 0, 61, 0, 83, 0, 1, 36, 36, 36, 36, 36, 5, 0, 65, 113, 101, 1, 52, 52, 52, 52,
        52, 52, 52, 52, 52, 5, 0, 100, 0, 21, 22, 22, 22, 22, 22, 23, 98, 99, 0, 50, 21, 22, 22, 22, 24,
        25, 22, 22, 22, 22, 23, 0, 115, 118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17,
        23, 30, 31, 0, 0, 0, 0, 83, 0, 0, 0, 59, 42, 42, 0, 0, 0, 0, 73, 74, 75, 42, 0, 0, 21,
        52, 52, 52, 4, 52, 52, 52, 52, 52, 52, 52, 4, 2, 2, 3, 52, 52, 4, 2, 2, 2, 2, 2, 2, 3
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "solids",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 448,
          width = 800,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 32,
          height = 448,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 768,
          y = 0,
          width = 32,
          height = 448,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 0,
          width = 736,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 128,
          width = 160,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 128,
          width = 288,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 128,
          width = 128,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 224,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 224,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 288,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 352,
          width = 160,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 320,
          width = 224,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 288,
          width = 160,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 416,
          width = 96,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 416,
          width = 128,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 320,
          width = 128,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "",
          shape = "rectangle",
          x = 608,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "player",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
