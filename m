Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A55CC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 07:46:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6220420882
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 07:46:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tlSNg+kT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfDCHqd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 03:46:33 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46462 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfDCHqd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 03:46:33 -0400
Received: by mail-pl1-f196.google.com with SMTP id y6so7599401pll.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Apr 2019 00:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cld4RhZn5TnQ5gVtif4Sk3V8APHdjBBFec+kPImys0s=;
        b=tlSNg+kTC49DC/j/sOTza0pWRoE021Yg1u2TXlmBwfk8Jl4k/ZjaKb9RiZpRzeWjnM
         yTaIr9ypOCxazcwCIBic5qYzoXfR+UV9qKROHNlNxdbp/7nSpb5e6KhDISl4Qsv6UGeX
         kdbRXynNefCSyjMoiQ/UesiWfIxzCt1zeR5QcPQGeQwVxp/TCp7yFIUCTeihJ/Jlz4QC
         ZOUnV+NDzGidQvjjXpUsSF664EqBDFfnBGAo80vkL9bFE13AZ8GBnCjy0r/L9hUYuprc
         6bpHsanE1IWt8Wkg/sNAvKrbFLoeHxLLTQK00ARWA6tkrMf+oLicbxzkL5Frf8GY8E1W
         6n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cld4RhZn5TnQ5gVtif4Sk3V8APHdjBBFec+kPImys0s=;
        b=OI+XNzHoBsFoES6TIGKAfEoGmZSdCqGxdmGZS2gTjzc1OeKKA/qRBq/eGiWYpLmVIK
         AkBC2REeyg7aZBDr7EPi3HtiUYdxnmmRNTugy8g8qA4q0OWw0vgYQUNS/ZmRHtCMTTHr
         NijohJc4c7E0P1oGJydrz6VkaUhU7olDaI7P4ACIADtaA6gMpvqNYRaoCn70kIBSrRQh
         rjGIo+GW7SUN7hzIaP6Zfk90qfC+e6ImYdCORpmkyhBl9jyVODIAtdh4MR+VuJEARQIQ
         kH3jlyQcez4J65FQ5yLScT9i3Fabs3gRFigC+mID9J090QzFW1EbyqlmMDJMNdJ/ieeG
         8ifw==
X-Gm-Message-State: APjAAAUrrgCns0yQrKUcC92dM8imANNMXgSdR0SROk2qivMvUUVKoQj4
        gU1E9DCIDea/5BxRyg5lPjIlWw==
X-Google-Smtp-Source: APXvYqzaB66xqtTS1PASDFpgTEJmoI+dIOZ+E8wM/vaYNJkuOHnvKhkII2l0fLA0+/zKK+TDUf+dGg==
X-Received: by 2002:a17:902:b60d:: with SMTP id b13mr22534693pls.100.1554277592924;
        Wed, 03 Apr 2019 00:46:32 -0700 (PDT)
Received: from dell ([147.50.13.10])
        by smtp.gmail.com with ESMTPSA id a129sm45468814pfa.152.2019.04.03.00.46.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 00:46:31 -0700 (PDT)
Date:   Wed, 3 Apr 2019 08:46:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>
Subject: Re: [PATCH 1/4] mfd: da9063: convert headers to SPDX
Message-ID: <20190403074627.GC11301@dell>
References: <20190318155728.28365-1-wsa+renesas@sang-engineering.com>
 <20190318155728.28365-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190318155728.28365-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 18 Mar 2019, Wolfram Sang wrote:

> Covnert the headers of the source and include files to SPDX.
> And fix some typos in the descriptions ("interrupt" instead of "I2C").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mfd/da9063-core.c            | 8 ++------
>  drivers/mfd/da9063-i2c.c             | 9 ++-------
>  drivers/mfd/da9063-irq.c             | 9 ++-------
>  include/linux/mfd/da9063/core.h      | 7 +------
>  include/linux/mfd/da9063/registers.h | 7 +------
>  5 files changed, 8 insertions(+), 32 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
