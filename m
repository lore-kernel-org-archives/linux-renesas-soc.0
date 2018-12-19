Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6CBC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 14:05:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99013218AF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545228313;
	bh=LuSGVaI3t2GnQ8Ee7/GZ9DZV/c899d6qhyA0T2zDi/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Eg2azewCbuPVx9jKFt0w+XhDQrPA/2KIsHenxGleismhgJJ8/sS4v3S/3hioghYMF
	 9rTHjooIsg9RQatIcxy0U8KVjRrNWitrAtlzZlolWXEyldpm1grpH/GbhUyy144fcz
	 xZR+wfSlXE0sHGrSEbVwvJ/Ra0Ldvi4Qu3EiEPnc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbeLSOFN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 09:05:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:50816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728452AbeLSOFN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 09:05:13 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C4BC218AF;
        Wed, 19 Dec 2018 14:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545228312;
        bh=LuSGVaI3t2GnQ8Ee7/GZ9DZV/c899d6qhyA0T2zDi/8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wuLxYjUkAwYO1BIGLT1LqsQxzTJutZ4TwtNg1qD0J4PhOVKYt2IFxGISxATtilw7k
         NJk0nX/FRsG6jg3AJgEhxn2D6TycfwV2ZIRX0wY8uHqu0Fz3knj8z9OzyTkjZy3SvK
         ZSrtfIVxgU9zAsiAbZsvZOnBVgNLjFZpA0RSeOB0=
Received: by mail-qt1-f173.google.com with SMTP id d19so22267933qtq.9;
        Wed, 19 Dec 2018 06:05:12 -0800 (PST)
X-Gm-Message-State: AA+aEWYJ0hPq6Dy6SkmIg1Tp3DlOA/NRo/FZqhZAs40+06wbPzlKsyh+
        xnrNiYAuXks+Pp6KJfqgez8spoo+EUgZKoxOJg==
X-Google-Smtp-Source: AFSGD/XvwQlDUMEhxHATkWRu49exKJM0xIQy3snHpGlvkhezbk4+lzCcnwoYnS8gNSM1VjyVkEx0u/5IkzgBgwC/bNI=
X-Received: by 2002:ac8:6b18:: with SMTP id w24mr22240408qts.144.1545228311617;
 Wed, 19 Dec 2018 06:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20181217144324.99422-1-chris.brandt@renesas.com>
 <20181217144324.99422-2-chris.brandt@renesas.com> <20181218150551.GA15519@bogus>
In-Reply-To: <20181218150551.GA15519@bogus>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 19 Dec 2018 08:05:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKqWG39zXa1iBmNvgjzsUhX29q0wkqXy5juKdwXV9_JWA@mail.gmail.com>
Message-ID: <CAL_JsqKqWG39zXa1iBmNvgjzsUhX29q0wkqXy5juKdwXV9_JWA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: r7s9210: Initial SoC device tree
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 18, 2018 at 9:05 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Dec 17, 2018 at 09:43:23AM -0500, Chris Brandt wrote:
> > Basic support for the RZ/A2 (R7S9210) SoC.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---

> > +     gic: interrupt-controller@e8221000 {
> > +             compatible = "arm,gic-400";
>
> Kind of strange that a single core A9 uses an external GIC rather than
> the built-in one.

Still have this question on v4. It should be "arm,cortex-a9-gic" if
the A9 built-in GIC is used.

Rob
