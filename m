Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB7BC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BD6420883
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732228AbfDBOv2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:51:28 -0400
Received: from sauhun.de ([88.99.104.3]:40450 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732200AbfDBOv2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 10:51:28 -0400
Received: from localhost (p5486CD10.dip0.t-ipconnect.de [84.134.205.16])
        by pokefinder.org (Postfix) with ESMTPSA id 7CAD22CF606;
        Tue,  2 Apr 2019 16:51:26 +0200 (CEST)
Date:   Tue, 2 Apr 2019 16:51:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] spi: sh-msiof: Use readl_poll_timeout_atomic()
 instead of open-coding
Message-ID: <20190402145125.GE5389@kunai>
References: <20190402144023.27422-1-geert+renesas@glider.be>
 <20190402144023.27422-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Content-Disposition: inline
In-Reply-To: <20190402144023.27422-3-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2019 at 04:40:22PM +0200, Geert Uytterhoeven wrote:
> Replace the open-coded loop in sh_msiof_modify_ctr_wait() by a call to
> the readl_poll_timeout_atomic() helper macro.
>=20
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>

Please use me Renesas related address. Like in this new tag:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyjduoACgkQFA3kzBSg
KbbFsw/+L2M2oFaP2KpxtFA3gHopRFjVQAea9WYiuaICzySNCHSDQl62kl8yIMhp
XnVNNLP9CLbKrmbeyvElQYmkeI99qCURT+3Y84BtobWja2ifE+7tHm5LxVRXTRVz
7vxlvp7Wd5I1DhddphJyOQsfGTFCx8d481fzCA7FGmvph5ctoBr777hZ8kUCtjjM
jc36cun72wFNeSuZ6TsCZNUt9jAdtWoFElyX7SncJs8NrZvhhGnc+Csz5w0ZTGyg
LMWig6OSzucrezcJzKHs34N6etJm4nYDM1eIUd4kISYFzy3cs/CpzZNVefwPIQ/9
GxnMVhwSeEel26pHuMeR191VfiC5kJwbgjE8+eaoFpWqYerl7/15Da2C+Ig9tVSZ
HpRaz2l93CTTeZn2h/aEdGQGf2e78JeT2NI8Yg3dQwEhAYdxgaL8be7C8el/7Xbp
fVrSfHgQq9SMxn7Iaz5rp++Pm0GybJc+RAB9Qg+mmIFbDTMn0pjLMpY55t4yHYs5
7K9WLZTHLRIY/DTMYuCwvDzmVLY2bPOEnzazTpD2p0g7jSMhhFae0HBDf42FPzkg
sHiZxqFHmd0zXqEjTHupUpe8QAT1f8iksQv5gWwrcoC53aaQNc/UZSun7X1kvxgf
FBPWpJm3uEqz6UiOcKkSbxmN8ZGBEG2NYa5gU1LIJ6OT9u105zQ=
=4n+I
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
