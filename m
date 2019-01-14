Return-Path: <SRS0=Pe4N=PW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9595BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Jan 2019 22:47:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6324B205F4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Jan 2019 22:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547506065;
	bh=5xP9XJUDhe/YtWVHuDVt4aPnhCF1PKoyAqtaoeP1fbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bhqQiEr5yBda0gBb4nqqF5B28rCHs6+x7ffZp1RBLNYwbfw8SQYE7Q3w8WtFoF7hV
	 sQwJA/YOOj7TYfsEHSEelVROGQFSaR130/jAaQRfv8x7rD8x4dKA1zN7bksEp/Hc79
	 6jmDkIpAmQ9jxWMQOCFQD6IaIM4JBW3HktOWnKgU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfANWro (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 14 Jan 2019 17:47:44 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40610 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfANWro (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jan 2019 17:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=U6kIQlafEwJL5uQLENw5NIGt1VFpiC1ju1PPuWIfKAY=; b=r9IsNsCjD2+VX3igWZ/APyqN/
        EiHMJMz3Y2+SYJBZfYyVnpwGjfcYwRHiDhR1Bn23TOfe3jeqW0sUiFxcHZ4ewk2j40iyD52Fc0DA3
        hTf0lipBIgnol7FPvQbj2uYnYAJluL9zS0GS5G+Ios0/Es6qothsRnUDeR4bFeABVJoWo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1gjB1B-00008i-2z; Mon, 14 Jan 2019 22:47:41 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 8ACE71127AD1; Mon, 14 Jan 2019 22:47:40 +0000 (GMT)
Date:   Mon, 14 Jan 2019 22:47:40 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT] spi-renesas-rpc: manual read issue workaround
Message-ID: <20190114224740.GI11073@sirena.org.uk>
References: <76eb5af5-756e-4d54-0be2-55573649d2d1@cogentembedded.com>
 <20190107181505.GR9570@sirena.org.uk>
 <e56eec35-9628-9c75-4a8d-685ffef5e2b9@cogentembedded.com>
 <20190108122907.GA6590@sirena.org.uk>
 <09bc4c3b-cd23-753e-0a26-a74c30ec3cf6@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IR1Y5IvQhrKgS4e6"
Content-Disposition: inline
In-Reply-To: <09bc4c3b-cd23-753e-0a26-a74c30ec3cf6@cogentembedded.com>
X-Cookie: From concentrate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--IR1Y5IvQhrKgS4e6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 10, 2019 at 09:38:33PM +0300, Sergei Shtylyov wrote:
> On 01/08/2019 03:29 PM, Mark Brown wrote:

> >>    As I said, the patch was atop of the RPC-IF driver patch by M. Yang.

> > Please don't submit patches for things that aren't upstream upstream.

>    Even with RFC/RFT in the subject?

It's certainly an issue for the testing side of things if someone needs
to apply it on top of a patch that isn't even on the list in order to
test!  It's obviously OK to propose changes to a thing that's currently
in review but it it's something nobody is even trying to upstream then
that's less helpful.

--IR1Y5IvQhrKgS4e6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw9EYsACgkQJNaLcl1U
h9B+Wgf/aB1ESu1E1oL6U81yca5MtePi4QQJctCWTiHpPop16/K+A+YYjSgWC1xB
TCS85Nv4G0UB4gppweUcYroGmcnoyYNcG24ismpAKKKiLIHsNvLJg+Z4PkClShBm
W2FSo8mbW76FLmmc+M03oixHwHxJBwtASTLRyv6Vy7NVqMh0LUKjiuWJzY86r+Ow
YDkt/tiTpvLsRFB71eyHX2Ak0q6JrAOQddkGGpMCOL+azogf0ilfOGN1PMlx8j91
6Wcxc0x55GdBk0aKqjVuNNxjOztB7bXcBRSiZhnfaqaz+Mp3UwyLJqt1cIxaQcJZ
zfxlD6UejFayfRzSKKU+NJiYi2tg7g==
=bpmr
-----END PGP SIGNATURE-----

--IR1Y5IvQhrKgS4e6--
