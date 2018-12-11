Return-Path: <SRS0=uxQs=OU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8221FC5CFFE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 11:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49E2220811
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 11:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjwK+nJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E2220811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbeLKLKx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 06:10:53 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37801 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbeLKLKw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 06:10:52 -0500
Received: by mail-wr1-f66.google.com with SMTP id j10so13627963wru.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Dec 2018 03:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JRnl0wYKb9mtQeSi8uRoEcL3t5SJcT9LEhgB2gahor4=;
        b=FjwK+nJe+ateSctnax+srLZHawangeLjKAC9kEI4h0FkIS0dScFbfF9gSPbTfaGhVG
         AInUIL8rDWa3QOPZTXX4/GQWH1YlvHZywk1sufeY3ssNO/8VfT5GAoIOeif14hUuSaSD
         bxD0m9pFF5DPlr1gtn5xtQKrp6GDoJUImqUrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JRnl0wYKb9mtQeSi8uRoEcL3t5SJcT9LEhgB2gahor4=;
        b=bUf134cPV83mQDWpv2VqxJLr1S6Xo7yjfsfoITxh53qIqELo1UJ+q7HT53fN2BsMm2
         CD7JLVl2Ho40e1jNUjaSkx3E7v3pVoiyEAB5CyumdVVxW36BOddD4821ux5ZTCBkfSXw
         4LC3ijfS0CgFMnXAb9O9PMy//MWN7bExFmn2EKiliK8ipc15LwR1R9bNbkZH1Pq4gB7G
         uXlwhFCeNV+OfZyd+eEqAauPHb3xjI6EiBy/FAwpndN/9qM+2mdDArFgb7jp3vRT5i2v
         Vd25FTj+2v6ZBkfKX7TCyKWCNwQkFqIb6dX1Q0MZT4iXUDvHlbyTd4Xp5VrZzaU43emo
         P9LA==
X-Gm-Message-State: AA+aEWZdAqcej/5uava6D4FHK+QjmC6FmDOU86kUtr70ZsSLa1AEfelr
        MWGccZmFBrEL9z8guRQLXCDboSG9gD8=
X-Google-Smtp-Source: AFSGD/VSnE48/EA1ypBKEbvHu+10Hu0MU6j7rXIEJywOKjUObvH+OY1VqAgTDuwdrJfEShEj2E1e1g==
X-Received: by 2002:adf:e488:: with SMTP id i8mr13532799wrm.10.1544526649748;
        Tue, 11 Dec 2018 03:10:49 -0800 (PST)
Received: from [192.168.86.29] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id u204sm4732811wmu.30.2018.12.11.03.10.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 03:10:49 -0800 (PST)
Subject: Re: [PATCH v3] nvmem: check invalid number of bytes in
 nvmem_{read,write}()
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-rtc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <1544520254-4210-1-git-send-email-biju.das@bp.renesas.com>
 <9f1a2851-58ca-2971-69d5-c1322b20130c@linaro.org>
 <OSBPR01MB210338DE328981500C6992F8B8A60@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdXraSz4dtBi0hzZ-w_goKiy_fObE0S-Vi6xQhSxHNnhqQ@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <43b3a03c-3739-94d2-c97d-c36999f04a9b@linaro.org>
Date:   Tue, 11 Dec 2018 11:10:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXraSz4dtBi0hzZ-w_goKiy_fObE0S-Vi6xQhSxHNnhqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 11/12/18 11:06, Geert Uytterhoeven wrote:
>> I was trying with arm32 toolchain and compiler happy. Now tried with Arm64 toolchain, it provides a warning and the below typecast fixed the issue.
>> if (unlikely(check_add_overflow(bytes, (size_t)offset, &new_bytes)))
>>
>> Does typecasting to (size_t)  fixed the issue in your environment? Please let  me know.
> That's a side-effect of offset not being loff_t...
check_add_overflow will expect all the params to be of same type, so 
changing to loff_t will not help too.


> I think that should be fixed first, else you will forget about
> removing the cast later
Yes, I agree.

> ("casts are evil").
