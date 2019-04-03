Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231C1C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 08:08:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6B2720830
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 08:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="llVc+5yY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728798AbfDCIIU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 04:08:20 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42489 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfDCIIU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 04:08:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id p6so7900706pgh.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Apr 2019 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WuEcbru8Ujw/2EXwYhzXjNVCHb6+XGxcyq6w9wzJens=;
        b=llVc+5yY6Qk0fjBq5kzMZtUqhwMEMNdqv94+ac1szxMe2Y0g4Y26Mo0e0SvEK9S2qQ
         s2LOERpvzUE15eXYgDQGHqVLKSRofnB0nW5vEikUXFO458kJCECqD7TDoRXm8tXrNON7
         6DhW5m6GAJT1NNUYW4Yeo2JoODY5/ow2yOZbz8EBdzMqrtu6rP7E5a0hGdUIvQrj82uZ
         695uVTn7/2odQmxYwKaEw3xGNB9mlZl4aYieHzo1xTmb0eu0tH930JgaB4XehBYd+48Z
         SUTfo6Rmy8JVQsdJHKhpsKGzuhFEvrdkuSh7Kcwa7K7eX/vz9/SRFocLQIZr18H4haoV
         hBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WuEcbru8Ujw/2EXwYhzXjNVCHb6+XGxcyq6w9wzJens=;
        b=tqoDwLlgrS5Omso+b+TkiiOf1sw9eTMBjfOSJ41H343ZzogH1fMpUpXqLKiv4zJP5Z
         43ukpbYF5G00Ti5Mecv/HNQa6U0VH6569ZWBr/Fkd1tSJFERw7Knez6qjKoSwZVL0yNV
         Zod9T0SbKq9lg9LYYDKsBoM5PVarxpZ8Cz2o4OyQSc64h3fRv57+x/MuzfzVB4jNYZZc
         dm8MhHi2rlq2A62//epQsrjPHubHD2/ggCRJQkIakUHTQv/eQ4XfjQDC8FRsnDDFbSlp
         mllN9op0oCSPm7GD9RBRnHWz5DgR+Ydep9lOpT8FgowgZhrOD8qcfABJVunUTkeJ2b1/
         edFw==
X-Gm-Message-State: APjAAAXOtaU0eWZ3eJkCtknj3vpMZJTpCklsjGYBvPFYEv3KucJ1GIeZ
        UDwqn/46Z3boxHFbDChqQfYz6Q==
X-Google-Smtp-Source: APXvYqydr0lz5sS77mGjhI9FxNqHH9c2oZLm8SejMXuK3BscOWmBRUwEDKK6hpRZBDJyYgKzXhwOyQ==
X-Received: by 2002:aa7:85cc:: with SMTP id z12mr73526059pfn.142.1554278899651;
        Wed, 03 Apr 2019 01:08:19 -0700 (PDT)
Received: from dell ([147.50.13.10])
        by smtp.gmail.com with ESMTPSA id r145sm10507207pgr.84.2019.04.03.01.08.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 01:08:18 -0700 (PDT)
Date:   Wed, 3 Apr 2019 09:07:58 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>
Subject: Re: [PATCH 5/6] mfd: da9063: remove leftover platform_data
 definitions
Message-ID: <20190403080758.GF11301@dell>
References: <20190318154759.21978-1-wsa+renesas@sang-engineering.com>
 <20190318154759.21978-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190318154759.21978-6-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 18 Mar 2019, Wolfram Sang wrote:

> Not used, not needed, remove them.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  include/linux/mfd/da9063/pdata.h | 65 ----------------------------------------
>  1 file changed, 65 deletions(-)
>  delete mode 100644 include/linux/mfd/da9063/pdata.h

Can't take this until the last user has been removed.

But for now:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
