Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44134 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932286AbcIEJqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2016 05:46:16 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux@armlinux.org.uk,
        hch@infradead.org, dan.j.williams@intel.com, vinod.koul@intel.com,
        robin.murphy@arm.com, linus.walleij@linaro.org, arnd@arndb.de
Subject: Re: [PATCHv9 3/6] dma-mapping: add dma_{map,unmap}_resource
Date: Mon, 05 Sep 2016 12:46:43 +0300
Message-ID: <2244107.fHLLTnqJPB@avalon>
In-Reply-To: <20160810112219.17964-4-niklas.soderlund+renesas@ragnatech.se>
References: <20160810112219.17964-1-niklas.soderlund+renesas@ragnatech.se> <20160810112219.17964-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

Thank you for the patch.

On Wednesday 10 Aug 2016 13:22:16 Niklas S=F6derlund wrote:
> Map/Unmap a device MMIO resource from a physical address. If no dma_m=
ap_ops
> method is available the operation is a no-op.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/DMA-API.txt   | 22 +++++++++++++++++-----
>  include/linux/dma-mapping.h | 36 +++++++++++++++++++++++++++++++++++=
+
>  2 files changed, 53 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.txt
> index 1d26eeb6..6b20128 100644
> --- a/Documentation/DMA-API.txt
> +++ b/Documentation/DMA-API.txt
> @@ -277,14 +277,26 @@ and <size> parameters are provided to do partia=
l page
> mapping, it is recommended that you never use these unless you really=
 know
> what the cache width is.
>=20
> +dma_addr_t
> +dma_map_resource(struct device *dev, phys_addr_t phys_addr, size_t s=
ize,
> +=09=09 enum dma_data_direction dir, unsigned long attrs)
> +
> +void
> +dma_unmap_resource(struct device *dev, dma_addr_t addr, size_t size,=

> +=09=09   enum dma_data_direction dir, unsigned long attrs)
> +
> +API for mapping and unmapping for MMIO resources. All the notes and
> +warnings for the other mapping APIs apply here. The API should only =
be
> +used to map device MMIO resources, mapping of RAM is not permitted.
> +
>  int
>  dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
>=20
> -In some circumstances dma_map_single() and dma_map_page() will fail =
to
> create -a mapping. A driver can check for these errors by testing the=

> returned -DMA address with dma_mapping_error(). A non-zero return val=
ue
> means the mapping -could not be created and the driver should take
> appropriate action (e.g. -reduce current DMA mapping usage or delay a=
nd try
> again later).
> +In some circumstances dma_map_single(), dma_map_page() and
> dma_map_resource() +will fail to create a mapping. A driver can check=
 for
> these errors by testing +the returned DMA address with dma_mapping_er=
ror().
> A non-zero return value +means the mapping could not be created and t=
he
> driver should take appropriate +action (e.g. reduce current DMA mappi=
ng
> usage or delay and try again later).
>=20
>  =09int
>  =09dma_map_sg(struct device *dev, struct scatterlist *sg,
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.=
h
> index e3bd27f..9a07882 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -264,6 +264,42 @@ static inline void dma_unmap_page(struct device =
*dev,
> dma_addr_t addr, debug_dma_unmap_page(dev, addr, size, dir, false);
>  }
>=20
> +static inline dma_addr_t dma_map_resource(struct device *dev,
> +=09=09=09=09=09  phys_addr_t phys_addr,
> +=09=09=09=09=09  size_t size,
> +=09=09=09=09=09  enum dma_data_direction dir,
> +=09=09=09=09=09  unsigned long attrs)
> +{
> +=09struct dma_map_ops *ops =3D get_dma_ops(dev);
> +=09unsigned long pfn =3D __phys_to_pfn(phys_addr);
> +=09dma_addr_t addr;
> +
> +=09BUG_ON(!valid_dma_direction(dir));
> +
> +=09/* Don't allow RAM to be mapped */
> +=09BUG_ON(pfn_valid(pfn));
> +
> +=09addr =3D phys_addr;
> +=09if (ops->map_resource)
> +=09=09addr =3D ops->map_resource(dev, phys_addr, size, dir, attrs);
> +
> +=09debug_dma_map_resource(dev, phys_addr, size, dir, addr);
> +
> +=09return addr;
> +}
> +
> +static inline void dma_unmap_resource(struct device *dev, dma_addr_t=
 addr,
> +=09=09=09=09      size_t size, enum dma_data_direction=20
dir,
> +=09=09=09=09      unsigned long attrs)
> +{
> +=09struct dma_map_ops *ops =3D get_dma_ops(dev);
> +
> +=09BUG_ON(!valid_dma_direction(dir));
> +=09if (ops->unmap_resource)
> +=09=09ops->unmap_resource(dev, addr, size, dir, attrs);
> +=09debug_dma_unmap_resource(dev, addr, size, dir);
> +}
> +
>  static inline void dma_sync_single_for_cpu(struct device *dev, dma_a=
ddr_t
> addr, size_t size,
>  =09=09=09=09=09   enum dma_data_direction dir)

--=20
Regards,

Laurent Pinchart
