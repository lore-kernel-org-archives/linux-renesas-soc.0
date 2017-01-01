Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:46102 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755167AbdAAXIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Jan 2017 18:08:05 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux@armlinux.org.uk,
        hch@infradead.org, dan.j.williams@intel.com, vinod.koul@intel.com,
        robin.murphy@arm.com, linus.walleij@linaro.org, arnd@arndb.de
Subject: Re: [PATCHv9 6/6] dmaengine: rcar-dmac: add iommu support for slave transfers
Date: Mon, 02 Jan 2017 01:08:04 +0200
Message-ID: <26490346.qhNpbOL6eO@avalon>
In-Reply-To: <6358234.jyTvyVnNF0@avalon>
References: <20160810112219.17964-1-niklas.soderlund+renesas@ragnatech.se> <20160810112219.17964-7-niklas.soderlund+renesas@ragnatech.se> <6358234.jyTvyVnNF0@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Monday 05 Sep 2016 12:52:44 Laurent Pinchart wrote:
> On Wednesday 10 Aug 2016 13:22:19 Niklas S=F6derlund wrote:
> > Enable slave transfers to a device behind a IPMMU by mapping the sl=
ave
> > addresses using the dma-mapping API.
> >=20
> > Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnate=
ch.se>
> > ---
> > drivers/dma/sh/rcar-dmac.c | 82 +++++++++++++++++++++++++++++++++++=
+-----
> > 1 file changed, 74 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.=
c
> > index cf983a9..22a5e40 100644
> > --- a/drivers/dma/sh/rcar-dmac.c
> > +++ b/drivers/dma/sh/rcar-dmac.c

[snip]

> > +static int rcar_dmac_map_slave_addr(struct dma_chan *chan,
> > +=09=09=09=09    enum dma_transfer_direction dir)
> > +{
> > +=09struct rcar_dmac_chan *rchan =3D to_rcar_dmac_chan(chan);
> > +=09struct rcar_dmac_chan_map *map =3D &rchan->map;
> > +=09phys_addr_t dev_addr;
> > +=09size_t dev_size;
> > +=09enum dma_data_direction dev_dir;
> > +
> > +=09if (dir =3D=3D DMA_DEV_TO_MEM) {
> > +=09=09dev_addr =3D rchan->src.slave_addr;
> > +=09=09dev_size =3D rchan->src.xfer_size;
> > +=09=09dev_dir =3D DMA_TO_DEVICE;
>=20
> Shouldn't this be DMA_FROM_DEVICE, and DMA_TO_DEVICE below ?

This comment can be ignored (thank you Robin for the explanation), but =
...

> > +=09} else {
> > +=09=09dev_addr =3D rchan->dst.slave_addr;
> > +=09=09dev_size =3D rchan->dst.xfer_size;
> > +=09=09dev_dir =3D DMA_FROM_DEVICE;
> > +=09}
> > +
> > +=09/* Reuse current map if possible. */
> > +=09if (dev_addr =3D=3D map->slave.slave_addr &&
> > +=09    dev_size =3D=3D map->slave.xfer_size &&
> > +=09    dev_dir =3D=3D map->dir)
> > +=09=09return 0;
> > +
> > +=09/* Remove old mapping if present. */
> > +=09if (map->slave.xfer_size)
> > +=09=09dma_unmap_resource(chan->device->dev, map->addr,
> > +=09=09=09=09   map->slave.xfer_size, map->dir, 0);
>=20
> Unless I'm mistaken the resource will not be unmapped when freeing ch=
annel
> resources, will it ?

I believe this one still needs to be addressed.

> > +=09map->slave.xfer_size =3D 0;
> > +
> > +=09/* Create new slave address map. */
> > +=09map->addr =3D dma_map_resource(chan->device->dev, dev_addr, dev=
_size,
> > +=09=09=09=09     dev_dir, 0);
> > +
> > +=09if (dma_mapping_error(chan->device->dev, map->addr)) {
> > +=09=09dev_err(chan->device->dev,
> > +=09=09=09"chan%u: failed to map %zx@%pap", rchan->index,
> > +=09=09=09dev_size, &dev_addr);
> > +=09=09return -EIO;
> > +=09}
> > +
> > +=09dev_dbg(chan->device->dev, "chan%u: map %zx@%pap to %pad dir: %=
s\n",
> > +=09=09rchan->index, dev_size, &dev_addr, &map->addr,
>=20
> > +=09=09dev_dir =3D=3D DMA_TO_DEVICE ? "DMA_TO_DEVICE" :
> "DMA_FROM_DEVICE");
>=20
> > +
> > +=09map->slave.slave_addr =3D dev_addr;
> > +=09map->slave.xfer_size =3D dev_size;
> > +=09map->dir =3D dev_dir;
> > +
> > +=09return 0;
> > +}

[snip]

--=20
Regards,

Laurent Pinchart
