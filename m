Return-Path: <SRS0=LzbD=2C=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF531C3F68F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Dec 2019 15:29:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADC5E2173E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Dec 2019 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576164540;
	bh=9/90AtUE2odEzoKIalV0qBNfNFz/2SaUIaAvjwThc5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=CZEOCIw14Tw/4Gv8utlcffBMcR2SMX8O8PXlhrJmlm1CoNt/q4nUEQdOJvA++vh9F
	 b2grp1HTL7iPqC7k3Tg4xxb3VVYcUYuXWdvCSkSMA+LDJB2euh2RApwMjijdGlKuPi
	 G0aREtBjSEQ9FA/OpAdld7oiw6tcVnHHcLb7OBe0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbfLLP3A (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 12 Dec 2019 10:29:00 -0500
Received: from foss.arm.com ([217.140.110.172]:50756 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728992AbfLLP3A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 10:29:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EB6A30E;
        Thu, 12 Dec 2019 07:28:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FE313F6CF;
        Thu, 12 Dec 2019 07:28:58 -0800 (PST)
Date:   Thu, 12 Dec 2019 15:28:55 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v2 0/6] spi: Add Renesas SPIBSC controller
Message-ID: <20191212152855.GD4310@sirena.org.uk>
References: <20191206134202.18784-1-chris.brandt@renesas.com>
 <922cfa46-efb5-9e6d-67ea-3ac505b8211c@cogentembedded.com>
 <TY1PR01MB156215E8668C0317FA0826B18A580@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <e6a73df5-31c4-3472-f7bc-a0984f1f5380@cogentembedded.com>
 <TY1PR01MB1562D343E1AB06DCA2973DAC8A550@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1562D343E1AB06DCA2973DAC8A550@TY1PR01MB1562.jpnprd01.prod.outlook.com>
X-Cookie: We have DIFFERENT amounts of HAIR --
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 12, 2019 at 02:29:07PM +0000, Chris Brandt wrote:
> On Wed, Dec 11, 2019, Sergei Shtylyov wrote:

> >    The last word from our BSP people was that JFFS2 doesn't work with the
> > HyperFLash dedicated BSP driver... :-/

> Is that why this "RPC" patch series is taking so long?
> It's a fairly simple piece of hardware.

The submitter appeared to be having difficulty with feedback from the
reviewers with knowledge of the hardware, then it looks like the last
version of the patch set didn't get any comments from any of those
reviewers.

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3yXLYACgkQJNaLcl1U
h9CWRAf/d0MNGnB7aK0YH7cmyHB95BuE2Ljgqzl+79JflqVMfGbDEZLG4CqVSalS
A7r5jUX6nfU3oI5DMuycdYsT6DnEcSeMXikHBTtb3qSt2Why1C7moQ+7yql8l3cN
icVqnMMLqMLcbEOjsMfZ4Kb3QwlgKbnZjXbpJtTlELz/i2Re3KPhCC2UX3laoYKI
KGtscAJnfFsf1G6bj3AtVQJk1o7daNFUAE2GTKAGRVKHjMQZW3WbatGNEPdQA6n2
GoIDVNFOFavSQ174YjzMpQ/5c1Am8h5yTioFtSAQyOcWHFbk8DbX0Pra9xsaD8pc
rfX4J9WWH3E5nLIRy9z1JZabk85x4w==
=D3b3
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
