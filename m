Return-Path: <linux-media-owner@vger.kernel.org>
Date: Wed, 14 Jun 2017 12:54:53 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 1/2] media: entity: Add get_fwnode_pad entity operation
Message-ID: <20170614095453.GH12407@valkosipuli.retiisi.org.uk>
References: <20170613143126.755-1-niklas.soderlund+renesas@ragnatech.se>
 <20170613143126.755-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170613143126.755-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 13, 2017 at 04:31:25PM +0200, Niklas S�derlund wrote:
> The optional operation can be used by entities to report how it maps its
> fwnode endpoints to media pad numbers. This is useful for devices which
> require advanced mappings of pads.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
