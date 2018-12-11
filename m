Return-Path: <SRS0=uxQs=OU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C1AC67839
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 09:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 772182082F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 09:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="flWk/xtd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 772182082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbeLKJzr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 04:55:47 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33457 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbeLKJzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 04:55:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id c14so13420151wrr.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Dec 2018 01:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ma+3LrckplbHCMdn+o7ywGisiWmlS7CTJKqJkXNdMog=;
        b=flWk/xtdby+3CEFX5xxW/elbG5GPHecO5KdSzKchuZ6OlguEnJKRnbWfcRG/L5tq35
         HHR2pjAzJs0z0eCHsa4F0VK1r0EHq/LMjv1SfHuf5iB6yN40W/mx6AvmCkKyHN44aRM9
         TKp4ilUtBMj5t26G49SNwYV5g37m/AqXBGI0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ma+3LrckplbHCMdn+o7ywGisiWmlS7CTJKqJkXNdMog=;
        b=r8fFRDfiYqfAKMSn7ZYQhcHAlgJCj6McQ9SusxqTVQiAFmbfr//dwzpBhLHJw17BbP
         gIXIWlhVXk4RA3nWvEKDPrJyWjJbliN91EmlqRc1eMloPzAiXIJ1BZUHO0ClgRqALfG7
         hTRwF82hU9udURw0SIKPgACJ2NnxHAZmZRMie6gGxGfpES/PQp37vBHpxgIdKsBvoOO5
         O1UQHtIUL6WA548Xvef35KK1x3rZj7HM9e8vy+eyHpgQzZXCvpsk+kaipn1ZAwg+okPy
         TU4H0H4nvb1NbB6UpuT4RFbmDjEoaGJE1LbWw/V4REQvb62ZKoHo+x6oOg55xQk9Gx/E
         TT1Q==
X-Gm-Message-State: AA+aEWZARkSa7kCDvC0hRMckeuf7qstm1DnfOZeIzgSCSyHYo79G4sS6
        s/dcYHnptTXIxWL6rlLUgVtZKrpZc50=
X-Google-Smtp-Source: AFSGD/VDSJntlDob4nN3baG1IoYZfmaYuVSDrIcUj2m40i3OGzKUK2r+YiVrliYou+3Blm2HVHRA1w==
X-Received: by 2002:a5d:6907:: with SMTP id t7mr12505249wru.226.1544522145099;
        Tue, 11 Dec 2018 01:55:45 -0800 (PST)
Received: from [192.168.86.29] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c10sm15325279wrw.49.2018.12.11.01.55.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 01:55:44 -0800 (PST)
Subject: Re: [PATCH v3] nvmem: check invalid number of bytes in
 nvmem_{read,write}()
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1544520254-4210-1-git-send-email-biju.das@bp.renesas.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9f1a2851-58ca-2971-69d5-c1322b20130c@linaro.org>
Date:   Tue, 11 Dec 2018 09:55:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1544520254-4210-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



After applying this patch I get below errors with W=1 C=1

On 11/12/18 09:24, Biju Das wrote:
> +	if (unlikely(check_add_overflow(bytes, offset, &new_bytes)))
> +		return -EOVERFLOW;
>   drivers/nvmem/core.c:82:13: error: incompatible types in comparison 
expression (different type sizes)
drivers/nvmem/core.c:82:13: error: incompatible types in comparison 
expression (different type sizes)
drivers/nvmem/core.c:113:13: error: incompatible types in comparison 
expression (different type sizes)
drivers/nvmem/core.c:113:13: error: incompatible types in comparison 
expression (different type sizes)



--srini
