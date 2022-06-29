Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF0EC433EF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 29 Jun 2022 15:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233142AbiF2Pa4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 11:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234313AbiF2Pac (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 11:30:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EDE387A8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 08:30:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BE363D7;
        Wed, 29 Jun 2022 17:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656516628;
        bh=/xRgMVmf4E2vpa6l2Pcj9tCQVQuxfOnaMk6inztqIsI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HhyXE0zzOBefkgvgF4KRasB+qeHUicBlDgB9HaVJORo39jpFUxit7kveww5aTBnyA
         h6iOazC5s4M46IkFGGJAXxWYANMvBxEFN2eB6WeNxdFaAWpbyIco6ddX0ZNT0ld9cA
         0uW+rGcA6vJ8CKXgf21XLZlAHzPR08D5d2Hv9vDc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220609234031.14803-4-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com> <20220609234031.14803-4-laurent.pinchart@ideasonboard.com>
Subject: Re: [kms-test] [PATCH 03/10] tests: allplanes: Log the plane IDs
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Wed, 29 Jun 2022 16:30:26 +0100
Message-ID: <165651662610.2049236.998658351377800963@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-06-10 00:40:24)
> Plane IDs are useful for debugging, log them.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  tests/kms-test-allplanes.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
> index 0fe6cfab0a2d..96ac4f19f538 100755
> --- a/tests/kms-test-allplanes.py
> +++ b/tests/kms-test-allplanes.py
> @@ -46,7 +46,8 @@ class AllPlanesTest(kmstest.KMSTest):
>                  continue
> =20
>              self.logger.log(f'Testing connector {connector.fullname}, CR=
TC {crtc.id}, '
> -                            f'mode {mode.name} with {len(planes)} planes=
')
> +                            f'mode {mode.name} with {len(planes)} planes=
 '
> +                            f'(P: {crtc.primary_plane.id}, O: {[plane.id=
 for plane in planes]})')

Is P plane / Primary ? And O ... Other ?

either way, it's debug info that's helpful (and I hope more obvious) to
the reader at runtime.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> =20
>              # Create a frame buffer
>              fb =3D pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.=
vdisplay, 'XR24')
> --=20
> Regards,
>=20
> Laurent Pinchart
>
