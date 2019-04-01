Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D890C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F08AA20880
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CkZ5er3c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfDAKZ4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 06:25:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45406 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbfDAKZ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 06:25:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E5CCC25B766;
        Mon,  1 Apr 2019 21:25:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554114354; bh=tQwEEa/3ncPiBWUQCyzSLOpB/A0UpBKLAwe223WuFZk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CkZ5er3cpUdTu/hY0odE+0900SB3KyHPlgCJVU7ILPvTgTncKh2/IG4q5AsW/yKh9
         uIEtlIhYTy9sSpDKVWMeeMJgCR7GVc5lNC5oK9vIHI6PBZtFpRvMGCi2GvhAJq2bFs
         3vZ9DWEcOsKls0W+fxHj4z29rSQv1R/iYoM5Y8os=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 20BAC94039A; Mon,  1 Apr 2019 12:25:52 +0200 (CEST)
Date:   Mon, 1 Apr 2019 12:25:52 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 4/8] pinctrl: sh-pfc: rcar-gen3: Remove HDMI CEC pins,
 groups, and functions
Message-ID: <20190401102551.wwznt2qnnccsx2u6@verge.net.au>
References: <20190329152942.13995-1-geert+renesas@glider.be>
 <20190329152942.13995-5-geert+renesas@glider.be>
 <20190401101425.5w7ueezlsat3fncz@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190401101425.5w7ueezlsat3fncz@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 01, 2019 at 12:14:26PM +0200, Simon Horman wrote:
> On Fri, Mar 29, 2019 at 04:29:38PM +0100, Geert Uytterhoeven wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > 
> > This reverts commit 7793ac664c5ebebdb021c4ec66ff9d174d58e98e.
> > 
> > The HDMI CEC function is not supported by the R-Car Gen3 Hardware Manual
> > Rev 1.00. Therefore, delete the corresponding pin groups and functions,
> > and rename the HDMI[01]_CEC definitions to match their GPIO
> > functionality.
> > 
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [geert: Squashed several commits]
> 
> Ok, but it now does a lot more than revert
> 7793ac664c5ebebdb021c4ec66ff9d174d58e98e.
> That confused me a bit.

That notwithstanding,

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

