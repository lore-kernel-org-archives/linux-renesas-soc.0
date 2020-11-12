Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552F3C55ABD
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Nov 2020 11:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E293122228
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Nov 2020 11:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fki1c333"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgKLLdQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 12 Nov 2020 06:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbgKLLcy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 06:32:54 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA363C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2020 03:32:52 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a3so5170752wmb.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2020 03:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=os5khahHPpWn88KMb1Vr8p8L3JIWYK0ZBr9FMB2vL0w=;
        b=fki1c333F915w4zFn8q2oOpYqkI7PxR0+mBFi4LEeODBMzzkPfR+IPXf726dBZaqD0
         f9RQewNzP/8HvVg0NAZmNJOlBfDB6r/EGLAKj7KJgmEwtZkXDAuCeFTFaNKVSKCSF4i0
         lT5c51hDRifK7TQPpYZ5EHNcvgT7AULWAUFJMqmDJgPDbNM19DXdzy2kKSYzc13/oxVi
         wvdNfkUBxhlkuZlbrGweY8e59SDhpSec54qntjAXNM8aubDywJ7BlYmSRK02+p0Ut6nD
         8x87nqMBQShPpoVh57f8+40KlJ0nSSo0oDn/UFKoMTacizC66jJlDIzNXgQahKEqHVvU
         E98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=os5khahHPpWn88KMb1Vr8p8L3JIWYK0ZBr9FMB2vL0w=;
        b=GqSboAL1bFpjxg41/um7uY0mNEojeplXTFhOINNFdpEMdlD618+Em2QSG2KE+Yb2Nl
         zDrSx8/8ypE4WJFQ6Kc+4hEfIq4caw3ksCpeGSY4cdzLccRGE77JWsI94BVZuqBeZp9u
         bCBxIGUJHSRkHJtSsb5kpyeo3+n7jh7UPlE4WvRg/Go0VWBp7qj52zuMhK9h4NnxNFf8
         OnMdeOgr3r+nR5TGzFl036KYUdY+f0QYicnc+6yHnuTgW1fl/8lAUmpyAzgTmbWLfHeH
         FqyRagbyHkaTb0Yu5fll0TbBMEW3s/n32fhxlXv47eAku89o1hSx1n3xVvXYZDwT2bG6
         AVKQ==
X-Gm-Message-State: AOAM531nvYpG858AJoO7BhLOTVULYyhnZ27PAJNWcNHg6SP7M7DxtHXM
        2qMzusS2kr0PFFqbQ7uwoPLbAA==
X-Google-Smtp-Source: ABdhPJxFHnwQpKvKP0sLSEDE51QQO9sH5IG91X48mB+/3vpw9ApQgn+iMRc5v+DP5drtBLYqVugkGw==
X-Received: by 2002:a1c:acc1:: with SMTP id v184mr8648685wme.63.1605180771454;
        Thu, 12 Nov 2020 03:32:51 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:6971:b700:3764:fa96? ([2a01:e34:ed2f:f020:6971:b700:3764:fa96])
        by smtp.googlemail.com with ESMTPSA id t74sm6330516wmt.8.2020.11.12.03.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 03:32:50 -0800 (PST)
Subject: Re: [PATCH v3] dt-bindings: thermal: rcar-thermal: Improve schema
 validation
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Rob Herring <robh@kernel.org>
References: <20201028153541.1736279-1-geert+renesas@glider.be>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <7c83cb9f-d8fc-b349-1da8-5e0bcb6da89f@linaro.org>
Date:   Thu, 12 Nov 2020 12:32:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028153541.1736279-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 28/10/2020 16:35, Geert Uytterhoeven wrote:
>   - Factor out common required properties,
>   - "interrupts", "clocks", and "power-domains" are required on R-Mobile
>     APE6, too,
>   - Invert logic to simplify descriptions.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
