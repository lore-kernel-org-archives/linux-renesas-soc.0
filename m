Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:17688 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S966023AbeCAFjb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Mar 2018 00:39:31 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "vinod.koul@intel.com" <vinod.koul@intel.com>
CC: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dmaengine: rcar-dmac: Check the done lists in
 rcar_dmac_chan_get_residue()
Date: Thu, 1 Mar 2018 05:39:24 +0000
Message-ID: <TY1PR06MB0992C7E4BBEB0AEBEB995444D8C60@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1517565915-14234-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1517565915-14234-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

Would you review this patch?
Or, should I rebase this on the latest your repo?

Best regards,
Yoshihiro Shimoda

> -----Original Message-----
> From: Yoshihiro Shimoda
> Sent: Friday, February 2, 2018 7:05 PM
> To: vinod.koul@intel.com
> Cc: dmaengine@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Yoshihi=
ro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Subject: [PATCH] dmaengine: rcar-dmac: Check the done lists in rcar_dmac_=
chan_get_residue()
>=20
> This patch fixes an issue that a race condition happens between a client
> driver and the rcar-dmac driver:
>=20
> - The rcar_dmac_isr_transfer_end() is called.
>  - The done list appears, and desc.running is the next active list.
> - rcar_dmac_chan_get_residue() is called by a client driver before
>   rcar_dmac_isr_channel_thread() is called.
>  - The rcar_dmac_chan_get_residue() will not find any descriptors.
>  - And, the following WARNING happens:
> 	WARN(1, "No descriptor for cookie!");
>=20
> The sh-sci driver with HSCIF (921,600bps) on R-Car H3 can cause this
> situation.
> So, this patch checks the done lists in rcar_dmac_chan_get_residue()
> and returns zero if the done lists has the argument cookie.
>=20
> Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/dma/sh/rcar-dmac.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2b2c7db..f748be6 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1264,8 +1264,17 @@ static unsigned int rcar_dmac_chan_get_residue(str=
uct rcar_dmac_chan *chan,
>  	 * If the cookie doesn't correspond to the currently running transfer
>  	 * then the descriptor hasn't been processed yet, and the residue is
>  	 * equal to the full descriptor size.
> +	 * Also, a client driver is possible to call this function before
> +	 * rcar_dmac_isr_channel_thread() runs. In this case, the "desc.running=
"
> +	 * will be the next descriptor, and the done list will appear. So, if
> +	 * the argument cookie matches the done list's cookie, we can assume
> +	 * the residue is zero.
>  	 */
>  	if (cookie !=3D desc->async_tx.cookie) {
> +		list_for_each_entry(desc, &chan->desc.done, node) {
> +			if (cookie =3D=3D desc->async_tx.cookie)
> +				return 0;
> +		}
>  		list_for_each_entry(desc, &chan->desc.pending, node) {
>  			if (cookie =3D=3D desc->async_tx.cookie)
>  				return desc->size;
> --
> 1.9.1
