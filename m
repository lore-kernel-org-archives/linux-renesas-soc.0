Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA7BC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:03:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFD8420882
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPKwutVM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfDCJDl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:03:41 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37449 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfDCJDk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 05:03:40 -0400
Received: by mail-pl1-f196.google.com with SMTP id w23so4761156ply.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Apr 2019 02:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4wwN5BRJGwbTz3oBf5E6XgsD3idZtNOSFTkaDmiSt+s=;
        b=tPKwutVM40UFFQZrHSlTKzsU9n0pl+YWBUGdzKo+iWBIrutVQU0Py00Vnlo/MZ+XrT
         s/1C2HBZAT9magH6h8GgjbvFeEf8+x655vTkdNQjYVZ2V5dcxsoKhvk+R+pqJObtzLMl
         kl8kCvNQVNuPf42MaB+cR7MUJpWLywDyiHgGKNCt1GiKCXAt2+7sd33rcp/xorUVGvG7
         zks3mKYyBuzINTyd8WhjK5QIKEQvv9Zt8Pz3CkwLYdr9IpIBuF5lTgMSi2Vkc6Bwtl7v
         3Hu6ZjHFv5xsTU9n4IRTPEb3yfSKvNM4XEMeKgu+D/gR6vz7kyQZqIDbwo1MfDv+l6Oq
         OrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4wwN5BRJGwbTz3oBf5E6XgsD3idZtNOSFTkaDmiSt+s=;
        b=k/Scpd0pmsfd+lOpvcgVg4xipRP3tcgR/0tmt21lPlr9sNJO7mLqcmv0MyDPf5nEmc
         Dp29TF/aWUblt9o7EpS/WknLvYAB/vJbwfp2FbFR2sCAngHkjN9EfiZlQaD9w4weBfFA
         hXJhyk1O9iEOjV0ZZAw2qvXL+/7Uw5Jb7H7+y3wN2P5HPY3CGtJ6h3FrHxbZXSgZ+Oqr
         xtACbfhc5zqSmhWguow7wWpUuU6Ftm4X8HgqiGhW6TMgI+CLZkIACrgAQLsylZzIUiYK
         4o2u2zu/Rvs3larkL9MC5U9MR2RuoZCwx8cAubFGuFLMEfjW2+PnqLgJH+1N/oQUVXJM
         HTkw==
X-Gm-Message-State: APjAAAX1yZ+CewkgJV1iZUZA8ouvyEcQYP0MgF/osm9YrOUPWqsG1PWk
        IEEHLrJu6vORh6hB8+pCZTHwiw==
X-Google-Smtp-Source: APXvYqy8qvRe6ajEm/rBNvnQLsUkRK88+EE9mchDyc57YYn89EQUcyiq4MboC3DdhDhO90FHWZpsWQ==
X-Received: by 2002:a17:902:2e03:: with SMTP id q3mr74244875plb.166.1554282219868;
        Wed, 03 Apr 2019 02:03:39 -0700 (PDT)
Received: from dell ([147.50.13.10])
        by smtp.gmail.com with ESMTPSA id v189sm45153409pgd.77.2019.04.03.02.03.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 02:03:39 -0700 (PDT)
Date:   Wed, 3 Apr 2019 10:03:34 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>
Subject: Re: [PATCH 5/6] mfd: da9063: remove leftover platform_data
 definitions
Message-ID: <20190403090334.GH11301@dell>
References: <20190318154759.21978-1-wsa+renesas@sang-engineering.com>
 <20190318154759.21978-6-wsa+renesas@sang-engineering.com>
 <20190403080758.GF11301@dell>
 <20190403085049.4clchelp4tgslikg@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190403085049.4clchelp4tgslikg@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 03 Apr 2019, Wolfram Sang wrote:

> On Wed, Apr 03, 2019 at 09:07:58AM +0100, Lee Jones wrote:
> > On Mon, 18 Mar 2019, Wolfram Sang wrote:
> > 
> > > Not used, not needed, remove them.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >  include/linux/mfd/da9063/pdata.h | 65 ----------------------------------------
> > >  1 file changed, 65 deletions(-)
> > >  delete mode 100644 include/linux/mfd/da9063/pdata.h
> > 
> > Can't take this until the last user has been removed.
> > 
> > But for now:
> > 
> > For my own reference:
> >   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 
> As I wrote in the cover-letter, I'd vote for all patches going in via
> MFD. Is that fine with you? Then I'll ping other maintainers for acks.

That's fine by me too.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
