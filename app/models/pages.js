'use strict'

const mongoose = require('mongoose')

const pageSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true
  },
  blog: [{
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
    virtuals: true
  }
}
)

const Page = mongoose.model('Page', pageSchema)

module.exports = Page
