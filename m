Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10A8C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 13:38:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 993EF2177E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 13:38:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT3A1R3t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfCKNib (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 09:38:31 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40720 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfCKNib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 09:38:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id g20so4278522wmh.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=schwPfgvBQobp2WA+XcmZ8hx+CMnepppt1zErxlagGE=;
        b=jT3A1R3tvjpiFEBW1qukAU0t+mOGyxaw2dUZ9l8bmeUFhtFIVeVHSLdMM9XxH1p1uo
         zYZ9qYlrsXLZ9U3dXD6lbqIbSa/9TayqtUrRAb/Yt/BjD/bCCf5rZpkaHLZRuSSGIYes
         0V/wJcNFMALWbycFPWqufYVqhzheOR/UfEaoJjdmYQQQoNXbyLOY/z6721rq06dfrpPq
         +YWwn7uHpyM3kC0LlX52lLJLeOfC+tDGSP535o9y6CAW1TlVH0ZaWhvxJ57yxCmz05gv
         O9/eeGGIRJcg5jv0FtA4xvPpP3Zhchqilr+LCu5PgT6+Ah3hyxM/VGnKAA/ZwMs5qFWG
         VKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=schwPfgvBQobp2WA+XcmZ8hx+CMnepppt1zErxlagGE=;
        b=t1qdfMM/+j+9nnJRB1c8zI+nhYaagsiB5Qt+kgdBKCHJ73z5ilRZp/0qzKaika4+Yy
         r8PROh0ZocB6h38eh1QN7QzGN1gHYlkkqLhmxAwBqt1UEg6KaZlQm7XeY96S/LeafkZn
         NygqBLXoscJ2KK6E5SwDNScXvWuN8XB7Tg6kBHhkFklITNTdro9Agl7N0NtvoJfjddbp
         uAj/6OAKao2o6U5r09P+H6GOeZhgmOW4lgj0AIFj7iHLbqCPOIYVgWW8NFviwHqrLude
         76ug0eOthGdw0jX8J5DM9tJc0CzxnYpRLYY5IKjVuUlWM7IKILu70RAu+WvcdTDGsz1X
         jdgg==
X-Gm-Message-State: APjAAAUeEChpVxiWkx7r+DjVqlVfT79MVIZfReXBzV0/AdLbetkB34GK
        fwVL7WZnFY4n5d+8x1MlS5HqQzYW
X-Google-Smtp-Source: APXvYqzhuEbBZtLwsEtBJsiYPNVTLHcFvq8/0CN+zlT6iH4cdFI6406VhWPoMewaJ7O8GbySEDYKew==
X-Received: by 2002:a7b:c344:: with SMTP id l4mr17055840wmj.121.1552311508618;
        Mon, 11 Mar 2019 06:38:28 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id y66sm29919319wmd.37.2019.03.11.06.38.27
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 06:38:27 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Enable CAN0, CAN1
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190309020642.15985-1-marek.vasut@gmail.com>
 <CAMuHMdU+Av1JfGNRdQRP=DzxiesNsqNp05taKwjUouOGW_mp3w@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <af0f7c0c-36f9-e350-077d-2c94764e4ae6@gmail.com>
Date:   Mon, 11 Mar 2019 14:38:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU+Av1JfGNRdQRP=DzxiesNsqNp05taKwjUouOGW_mp3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/11/19 10:46 AM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sat, Mar 9, 2019 at 3:06 AM <marek.vasut@gmail.com> wrote:
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Enable both CAN0 and CAN1 controllers on R8A77995 Draak board,
>> since they are available on connectors CN43, CN44 respectively.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Thanks for your patch!
> I assume you have tested this with your CAN-analyzer?

Nope, only remotely between two CAN ports thus far.

-- 
Best regards,
Marek Vasut
