Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E99DC04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:09:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 089D820839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 089D820839
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbeLLKJo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 05:09:44 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41514 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbeLLKJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 05:09:44 -0500
Received: by mail-ed1-f67.google.com with SMTP id z28so15043462edi.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Dec 2018 02:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O14oezGn0qmRYfjDZ3lSh1IXfhWpIwxTsdg3rzwioVg=;
        b=BK46F1ySC8mv/Db4cvlCujFtDiqypmJlYKlP4bISSqyxbVN/RfQjbboQaaY6a8vXMH
         rRDqaYsmpXErdTP4zIIL96ai2RCgpUIOzC0X257RtHcqrpgfpNPd0vVklBJMxN0sEoEr
         yd+OR0Q6vFNJJQVvLnufIDVZ+uIoOB1VJrN905/eVZhtkfopu9Nq0EVVD8Hl9xCBQdcj
         jaxhXMb0RF6ug15MhCHeYR0LD1BO4kMtaWKLuA9pm06nPZhFw5htFzRJZzfBUfsteDNG
         cr1BvUFpBDPqRcMRNzE02AAy3BXf4SKTgVrFAwlIEJv2JZTDRpZOQdJfylR42LGCmmNf
         W85A==
X-Gm-Message-State: AA+aEWYLRlTt5dhtR4ZRnPmX0ISiHwiZnLzMdZHBaQ28PMSwAn/G19e2
        F2UEWu1Yq3sX/G7viDtLiGSXqQ==
X-Google-Smtp-Source: AFSGD/UfKIBZQqEiOopL3J2t3uDzi2bvRA6YwY3VE6/QcTaXEOTr+/9JHG6GSQq2hhNEF7C0IfT8rQ==
X-Received: by 2002:a50:b744:: with SMTP id g62mr18629208ede.14.1544609382820;
        Wed, 12 Dec 2018 02:09:42 -0800 (PST)
Received: from shalem.localdomain (546A5441.cm-12-3b.dynamic.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id l51sm4960061edb.36.2018.12.12.02.09.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Dec 2018 02:09:41 -0800 (PST)
Subject: Re: [RFC/RFT 00/10] i2c: move handling of suspended adapters to the
 core
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20181210210310.12677-1-wsa+renesas@sang-engineering.com>
 <2094a0d4-733f-7f74-abd2-bdb28edd0f80@redhat.com>
 <20181211234102.GA6701@kunai>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e8c68ef5-5085-e304-4959-82c4959f4511@redhat.com>
Date:   Wed, 12 Dec 2018 11:09:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181211234102.GA6701@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 12-12-18 00:41, Wolfram Sang wrote:
> Hi Hans,
> 
> thanks for testing this series!
> 
>> Note that the i2c-sprd driver changes in your patchset also get close
>> to triggering this problem, but they dodge the bullet because there
>> are separate system-wide and runtime suspend handlers and only the
>> system-wide handlers call the new i2c_mark_adapter_suspended() function.
> 
> Yes, this what I assumed to be all around - seperate handlers for RPM
> and PM. And I also assumed that they could be seperated if they aren't
> already. Until I read...
> 
>> As I explain in the commit message of the first attached patch
>> simply always using split handlers is not really an option because
>> of adapter drivers using DPM_FLAG_SMART_PREPARE or
>> DPM_FLAG_SMART_SUSPEND.
> 
> ... this. I don't know what these flags do (and reading SMART in there
> gives me more a 'uh-oh' feeling)

On x86 the lines between runtime suspend and system-suspend are blurring
with technologies like "connected standby" and in general devices moving
to suspend2idle as system-suspend state, I guess this also applies to
modern smartphone platforms but I'm not following those closely.

What this means on x86 is that the firmware is not doing any suspend
handling anymore and the OS / device-drivers get to do all the suspend.
For many devices this means that if they are runtime-suspended, and there
is no difference between the runtime and system suspend handling at the
driver level, they can be left as is, so during a system suspend they are
not touched at all (and left runtime suspended during system resume).

The "SMART" bit is really not all that smart, SMART_PREPARE means that
the drivers pm prepare callback will return positive non 0 (e.g. 1) to
indicate that the device may not be kept in its runtime suspended
state when transitioning to system-suspend, otoh when the prepare
callback returns 0 and the SMART_PREPARE flag is set then *all* suspend/
resume handling can be skipped during a system suspend.

SMART_SUSPEND means that if the device is runtime-suspended it may be left
as such, this only gets checked if the driver either does not have the
SMART_PREPARE flag, or the prepare callback indicated that skipping the
entire suspend/resume handling is not ok.

So this is not that scary, but it does require driver authors to know
what they are doing...

> but if the handlers can't be split, the
> issues you were seeing are a consequence, yes.
> 
> For me, this sadly spoils the whole concept. The patches you add make
> things even more complicated. Not happy about that.

Agreed, they don't fill me with happiness either.

> Looking at the open coded version you did for the designware driver, I
> wonder now if it is better to just leave it at driver level? Need to
> sleep over it, though.

I myself was thinking in the same direction (leave the entire suspended
check at the driver level).

Regards,

Hans
