Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35D5C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 16:48:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD92F20868
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 16:48:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfCHQsz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 11:48:55 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54141 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbfCHQsz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 11:48:55 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B494FC0006;
        Fri,  8 Mar 2019 16:48:51 +0000 (UTC)
Date:   Fri, 8 Mar 2019 17:49:25 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH/RFC 05/15] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Message-ID: <20190308164925.jwgq4rdqh6mmwwtf@uno.localdomain>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fmhj6g4gxg4ka2nj"
Content-Disposition: inline
In-Reply-To: <20190306232345.23052-6-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fmhj6g4gxg4ka2nj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Thu, Mar 07, 2019 at 01:23:35AM +0200, Laurent Pinchart wrote:
> The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
> dual-link. In dual-link mode both input ports are used to carry even-
> and odd-numbered pixels separately. Document this in the DT bindings,
> along with the related rules governing port and usage.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/thine,thc63lvd1024.txt         | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> index 37f0c04d5a28..4ff6eb9bbc19 100644
> --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> @@ -28,6 +28,13 @@ Optional video port nodes:
>  - port@1: Second LVDS input port
>  - port@3: Second digital CMOS/TTL parallel output
>
> +The device can operate in single-link mode or dual-link mode. In single-link
> +mode, all pixels are received on port@0, and port@1 shall not contain any
> +endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
> +odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
> +endpoints.

You know, I'm not sure this is helpful, as if we have to go and
describe what the chip supports, a paragraph for dual ouput mode would
be required as well. The bindings already document that the chip
supports single/dual input/output modes, maybe you can just add rules
that prescribes how to populate the endpoints, for both input and
output modes?

> +
> +

You can drop this empty line.

Thanks
   j

>  Example:
>  --------
>
> --
> Regards,
>
> Laurent Pinchart
>

--fmhj6g4gxg4ka2nj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlyCnRUACgkQcjQGjxah
VjwEow/+LflqXWN5RKHsIxOibqt3qnn6ImaFNTUP4lfnovmstG4bvZWHW0gi56Cu
bDFnDHicpDEplvJ68BFY0LGAaIowY/4jnE/tuUt3FwCg/nzrluLt69Dg7wVucaet
HjSm2MhW9DXXscGWKqH3rPtCAX2nLHZJzim5HAWkJ+ImJTYINxJmArYclBLONvFU
b2zLHjYM8QZnqMwP0pNuXgRPuqnTRWBIB23acJ0sMinnQLxkXnMpR2zvN0xU6Pbq
yfDlNaKIWZ1Snz3rjqMlivI7J9/iNSNCYS77S4vqRjLIhfkMtvrogim6fOtTZGYg
1fCofTtneM9uP8kQdjPC7Rfbg/3Udmg/PG1VCjhtxQsPRS/1Xxo5rFp1IkV8vFoq
X5er4gZGsu8dfhBu4ZThKp4OrIE4nMgpVEngytxPrjp3Yf9XinjlW1nhIulOsjCz
TS4gSC5EbfQdb8tW4triqIpj8JeJBbCu84hzJH+23iqRAMm7QefqIAqUt5y87+4X
aOeBBSnyi+IDpdU8KiQSyorsioeIDmokmgAaUDJpwmVLHk8lsbuvIPuUT5bbf07d
BqhrvgD9loWc3GwInfu/TlCfWQ/gq5ZE5gC1ClBxVi+AR3ahtAJ859ykml3bkAtV
o661bRkWEXk+4dAmLjLn6+UA+ZeQS7uLeczePS7/YmCAZ1rBKjI=
=ifmn
-----END PGP SIGNATURE-----

--fmhj6g4gxg4ka2nj--
