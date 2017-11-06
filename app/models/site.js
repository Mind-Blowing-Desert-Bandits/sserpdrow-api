'use strict'

const mongoose = require('mongoose')

const siteSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true
  },
  blogposts: [{
    title: {
      type: String,
      required: true
    },
    textcontent: {
      type: String,
      required: true
    },
    date: {
      type: Date,
      default: Date.now
    }
  }],
  pages: [{
    type: {
      type: String,
      enum: ['about', 'hours', 'contact']
    },
    title: {
      type: String,
      required: true
    },
    textcontent: {
      type: String,
      required: true
    }
  }],
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      const userId = (options.user && options.user._id) || false
      ret.editable = userId && userId.equals(doc._owner)
      return ret
    }
  }
}
)

const Site = mongoose.model('Site', siteSchema)

module.exports = Site
