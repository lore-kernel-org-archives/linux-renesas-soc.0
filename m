Return-Path: <linux-media-owner@vger.kernel.org>
Date: Wed, 24 May 2017 16:28:34 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 1/2] v4l: async: check for v4l2_dev in
 v4l2_async_notifier_register()
Message-ID: <20170524132833.GM29527@valkosipuli.retiisi.org.uk>
References: <20170524000727.12936-1-niklas.soderlund@ragnatech.se>
 <20170524000727.12936-2-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170524000727.12936-2-niklas.soderlund@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 24, 2017 at 02:07:26AM +0200, Niklas S�derlund wrote:
> From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Add a check for v4l2_dev to v4l2_async_notifier_register() as to fail as
> early as possible since this will fail later in v4l2_async_test_notify().
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
