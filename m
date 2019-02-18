Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E742C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 22:18:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6872217D9
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 22:18:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ccbib.org header.i=@ccbib.org header.b="Agv3J908"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731614AbfBRWS2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 17:18:28 -0500
Received: from h1.radempa.de ([176.9.142.194]:39663 "EHLO mail.cosmopool.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731611AbfBRWS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 17:18:27 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.cosmopool.net (Postfix) with ESMTP id DFFC9900B0F;
        Mon, 18 Feb 2019 23:18:24 +0100 (CET)
Received: from mail.cosmopool.net ([127.0.0.1])
        by localhost (mail.b.radempa.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id o7l6AdSbOyyR; Mon, 18 Feb 2019 23:18:24 +0100 (CET)
Received: from stardust.g4.wien.funkfeuer.at (213162072137.public.t-mobile.at [213.162.72.137])
        by mail.cosmopool.net (Postfix) with ESMTPSA id 87663900316;
        Mon, 18 Feb 2019 23:18:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ccbib.org; s=201902;
        t=1550528304; bh=fszfhVL9GFAz80iZgaicybagEQsldwNeUejuk6k8lnw=;
        h=From:To:cc:Subject:In-reply-to:References:Date:From;
        b=Agv3J908iV1JWiEeeMp+MioA0DvOGtnkG384L+2IDn9VxMHwDD/luxdtVq6j6v598
         WR1KvXjVnt3rCevIEW7l4eCq3A8W2qbvJXa0/cnPaLnrmg8EJ424DI1vs92BrIl6v4
         ucCybH9wQCrV6r+dGpfcxFKjueAxi8LD0WA8jDkw=
Received: from lambda by stardust.g4.wien.funkfeuer.at with local (Exim 4.89)
        (envelope-from <harald@ccbib.org>)
        id 1gvrEx-0000K7-Ks; Mon, 18 Feb 2019 23:18:19 +0100
From:   Harald Geyer <harald@ccbib.org>
To:     Marek Vasut <marek.vasut@gmail.com>
cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
In-reply-to: <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com>
References: <20190216174859.15738-1-marek.vasut@gmail.com> <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at> <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com> <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at> <75846117-242c-6861-ace5-dccf88711208@gmail.com> <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at> <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com> <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at> <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com>
Comments: In-reply-to Marek Vasut <marek.vasut@gmail.com>
   message dated "Mon, 18 Feb 2019 19:58:09 +0100."
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1245.1550528299.1@stardust.g4.wien.funkfeuer.at>
Date:   Mon, 18 Feb 2019 23:18:19 +0100
Message-Id: <E1gvrEx-0000K7-Ks@stardust.g4.wien.funkfeuer.at>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Marek Vasut writes:
> So what about
> 
> gpios-states : Initial state of GPIO pins in "gpios" array, set on
> system start and retained until consumer changes the state. 0: LOW, 1:
> HIGH. Default is LOW if nothing else is specified.

No. "retained until consumer changes the state" is promising more then
is guaranteed.

From the explanations provided by Mark it is clear that this property
is an artifact of the implementation in linux. I think we should document
is as such. How about:

gpios-states : On operating systems, that don't support reading back gpio
	       values in output mode (most notably linux), this array
	       provides the state of GPIO pins set when requesting them
	       from the gpio controller. Systems, that are capable of
	       preserving state when requesting the lines, are free to
	       ignore this property. 0: LOW, 1: HIGH. Default is LOW if
	       nothing else is specified.

HTH,
Harald

-- 
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
