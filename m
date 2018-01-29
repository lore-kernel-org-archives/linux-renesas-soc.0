Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 29 Jan 2018 14:08:13 -0600
From: Rob Herring <robh@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: adv7604: Add support for
 i2c_new_secondary_device
Message-ID: <20180129200813.ifaz2bkkxshiodga@rob-hp-laptop>
References: <1516625389-6362-1-git-send-email-kieran.bingham@ideasonboard.com>
 <1516625389-6362-2-git-send-email-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1516625389-6362-2-git-send-email-kieran.bingham@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jan 22, 2018 at 12:49:56PM +0000, Kieran Bingham wrote:
> From: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
> 
> The ADV7604 has thirteen 256-byte maps that can be accessed via the main
> I�C ports. Each map has it own I�C address and acts as a standard slave
> device on the I�C bus.
> 
> Allow a device tree node to override the default addresses so that
> address conflicts with other devices on the same bus may be resolved at
> the board description level.
> 
> Signed-off-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
> [Kieran: Re-adapted for mainline]
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
> Based upon the original posting :
>   https://lkml.org/lkml/2014/10/22/469
> ---
>  .../devicetree/bindings/media/i2c/adv7604.txt      | 18 ++++++-

Reviewed-by: Rob Herring <robh@kernel.org>

In the future, please split bindings to separate patch.

>  drivers/media/i2c/adv7604.c                        | 60 ++++++++++++++--------
>  2 files changed, 55 insertions(+), 23 deletions(-)
