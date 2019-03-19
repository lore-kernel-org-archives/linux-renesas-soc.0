Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11872C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 14:13:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2A2D2133D
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 14:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ccbib.org header.i=@ccbib.org header.b="pwAgVaE5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfCSONM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 10:13:12 -0400
Received: from h1.radempa.de ([176.9.142.194]:34485 "EHLO mail.cosmopool.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726579AbfCSONM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 10:13:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.cosmopool.net (Postfix) with ESMTP id 64A62901678;
        Tue, 19 Mar 2019 15:13:09 +0100 (CET)
Received: from mail.cosmopool.net ([127.0.0.1])
        by localhost (mail.b.radempa.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jXOxcF9PNLMy; Tue, 19 Mar 2019 15:13:08 +0100 (CET)
Received: from stardust.g4.wien.funkfeuer.at (77.117.209.252.wireless.dyn.drei.com [77.117.209.252])
        by mail.cosmopool.net (Postfix) with ESMTPSA id 59373900277;
        Tue, 19 Mar 2019 15:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ccbib.org; s=201902;
        t=1553004788; bh=OMl9s66iTz0BhD9dq8ejQR3T3EP86Aij+/GjnxM5hAM=;
        h=From:To:cc:Subject:In-reply-to:References:Date:From;
        b=pwAgVaE5RxMbXCbwp89G3W+++8E+YOCk2PGFBgL5HLUpAygv0fDpfHXwVSVA6Imv4
         hAwWucbTL7y8nTNeoKVKHDIdMJXxba9VEvTzFl2sntBr9ejxdtEsMZMxn6RaK7522z
         5oSbKd/lerAK2/o3BcuxkRd6YocyEMGyNHLeVWt0=
Received: from lambda by stardust.g4.wien.funkfeuer.at with local (Exim 4.89)
        (envelope-from <harald@ccbib.org>)
        id 1h6FUH-0000Kg-28; Tue, 19 Mar 2019 15:13:05 +0100
From:   Harald Geyer <harald@ccbib.org>
To:     marek.vasut@gmail.com
cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V3] regulator: gpio: Reword the binding document
In-reply-to: <20190316202552.21525-1-marek.vasut@gmail.com>
References: <20190316202552.21525-1-marek.vasut@gmail.com>
Comments: In-reply-to marek.vasut@gmail.com
   message dated "Sat, 16 Mar 2019 21:25:51 +0100."
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1280.1553004784.1@stardust.g4.wien.funkfeuer.at>
Date:   Tue, 19 Mar 2019 15:13:04 +0100
Message-Id: <E1h6FUH-0000Kg-28@stardust.g4.wien.funkfeuer.at>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

marek.vasut@gmail.com writes:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Reword the binding document to make it clear how the propeties work
> and which properties affect which other properties.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Harald Geyer <harald@ccbib.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Make "gpios" a mandatory property
>     - Reword "gpio-states" property description
>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
> V3: - Use gpio-states description from Harald
> Note: The recent gpio-regulator rework caused breakage. While the
>       changes in the gpio-regulator code were according to the DT
>       binding document, they stopped working with older DTs. Make
>       the binding document clearer to prevent such breakage in the
>       future.

Thanks for taking care of this!

Reviewed-by: Harald Geyer <harald@ccbib.org>
