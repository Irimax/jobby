
const express = require('express')

const router = express.Router()

router.get('/', (req, res, next) => {
  res.json([
    {
      'type': 'links',
      'links': [
        {
          'title': 'Accueil',
          'link': '/home',
          'icon': '',
          'id': 'home'
        },
        {
          'title': 'Contact',
          'link': '/form',
          'icon': '',
          'id': 'contactf'
        },
        {
          'title': 'Blog',
          'link': '/blog',
          'icon': '',
          'id': 'blog'
        },
        {
          'title': 'facebook',
          'link': '',
          'icon': 'fab fa-facebook-square',
          'id': 'facebook'
        },
        {
          'title': 'twitter',
          'link': '',
          'icon': 'fab fa-twitter-square',
          'id': 'twitter'
        }
      ]
    },
    {
      'type': 'locations',
      'links': [
        {
          'title': 'Lille',
          'links': '',
          'icon': '',
          'id': 'lille'
        },
        {
          'title': 'Paris',
          'links': '',
          'icon': '',
          'id': 'paris'
        },
        {
          'title': 'Bordeaux',
          'links': '',
          'icon': '',
          'id': 'bordeaux'
        },
        {
          'title': 'Lyon',
          'links': '',
          'icon': '',
          'id': 'lyon'
        },
        {
          'title': 'Marseille',
          'links': '',
          'icon': '',
          'id': 'marseille'
        }
      ]
    }
  ])
})

module.exports = router
