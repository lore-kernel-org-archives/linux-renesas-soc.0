Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCCAC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 14:50:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0BFC20449
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 14:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbQjx4gF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbeLNOur (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 09:50:47 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34012 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbeLNOur (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 09:50:47 -0500
Received: by mail-lf1-f65.google.com with SMTP id p6so4463920lfc.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Dec 2018 06:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=enconwufdaMtd19Uk+A/NnhqSUl+hQm5AjTKAvGt05I=;
        b=WbQjx4gFi2s/2IPNiua3fG5gjAntBStUUGPmMS+kHH+LGfwJ5Yjz1LOi+4d1Mux3RN
         iXjmBMmH8UkrQdjZ4zYj6sQavYS2dvPfbXpKKbd2LEQsZSsp5eXaGewkuhnkyW+sqPip
         yO9RwFCQ/W+k/Vp1F9UB5dX6m8tIB3xp+eY0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=enconwufdaMtd19Uk+A/NnhqSUl+hQm5AjTKAvGt05I=;
        b=GaOt4t7WVhlj3IZ7fU+6iSrOqbtmo7oGsBPDhskDX7/oAqn6PfBOch1Ayri7weIJFI
         /IjLSl9b+jJC3yj3f1/kdTCcFeoJGNSAFEX26oHfkVkUhPL8/JSXcuIhBhAz1c6QFEYs
         wHcRkdtq7PzYEGImfvqUtIniz/b4grTI5G/etaj34jtmEPbW5lOI2ngdWOe7AvwYO9SW
         /RSOZ0cNj/UaWtpfSgnkaKtAOMESnPCXzoN57Ci/b/RXipMCBUyYwxo79ADBHx0rcA4v
         M9kgRJhisWMQYVNsdmIQ28/lu/cVJye6iE4ex/GRhYFqltbepFLJ7Vg/NE8zpooLG8h3
         ML1A==
X-Gm-Message-State: AA+aEWb3/JztyWw20b+VlajbRUP9iAUoKDKzm+Qak6JXrs+r2KA1/Vmf
        B/A3Bl6uUcoyt3Qg1LM9K9jVdO/H8ivEps+FQGe7qQ==
X-Google-Smtp-Source: AFSGD/UKAhnPALpslRIJdD1JQVotYkUx+VLRMVXy/BnVN2e6DFbBRkrw31G7CC5bQ33G+74VXhc9tMLp4u4aXiWGWio=
X-Received: by 2002:a19:4849:: with SMTP id v70mr1973288lfa.62.1544799045424;
 Fri, 14 Dec 2018 06:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Dec 2018 15:50:33 +0100
Message-ID: <CACRpkda_062r5KzTtPE6zf+FDXGiLqCTw=Q1AB3SKLkAa05Qsw@mail.gmail.com>
Subject: Re: [PATCH V2 01/14] gpio: pca953x: Deduplicate the bank_shift
To:     Mark Vasut <marek.vasut@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I applied the whole series to an immutable branch and pushed to
kernelorg for testing in zeroday. If it builds fine I will push it
to devel.

Must say this series is impressive. It's doing away with a whole
slew of "technical debt" (old code not using modern frameworks).

Strangely this driver doesn't support any pin config, it even seems
to have per-pin debounce and everything. Some can be quickly
supported by just adding the .set_config() callback, others like
pull up/down are more dubious. If it supports open drain in hardware
we should definately make use of it. Just in case you're interested!

Yours,
Linus Walleij
