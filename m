Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58741 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752659AbdAKOzw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 09:55:52 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        Vinod Koul <vinod.koul@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] dmaengine: rcar-dmac: unmap slave resource when channel is freed
Date: Wed, 11 Jan 2017 16:56 +0200
Message-ID: <2176183.f66EgkImrW@avalon>
In-Reply-To: <20170111143931.9611-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170111143931.9611-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

Thank you for the patch.

On Wednesday 11 Jan 2017 15:39:31 Niklas S=F6derlund wrote:
> The slave mapping should be removed together with other channel
> resources when the channel is freed. If it's not unmapped it will han=
g
> around forever after the channel is freed.
>=20
> Fixes: 9f878603dbdb7db3 ("dmaengine: rcar-dmac: add iommu support for=
 slave
> transfers") Reported-by: Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/dma/sh/rcar-dmac.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2e441d0ccd79..4c357d475465 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -986,6 +986,7 @@ static void rcar_dmac_free_chan_resources(struct
> dma_chan *chan) {
>  =09struct rcar_dmac_chan *rchan =3D to_rcar_dmac_chan(chan);
>  =09struct rcar_dmac *dmac =3D to_rcar_dmac(chan->device);
> +=09struct rcar_dmac_chan_map *map =3D &rchan->map;
>  =09struct rcar_dmac_desc_page *page, *_page;
>  =09struct rcar_dmac_desc *desc;
>  =09LIST_HEAD(list);
> @@ -1019,6 +1020,13 @@ static void rcar_dmac_free_chan_resources(stru=
ct
> dma_chan *chan) free_page((unsigned long)page);
>  =09}
>=20
> +=09/* Remove slave mapping if present. */
> +=09if (map->slave.xfer_size) {
> +=09=09dma_unmap_resource(chan->device->dev, map->addr,
> +=09=09=09=09   map->slave.xfer_size, map->dir, 0);
> +=09=09map->slave.xfer_size =3D 0;
> +=09}
> +
>  =09pm_runtime_put(chan->device->dev);
>  }

--=20
Regards,

Laurent Pinchart
