Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802A1C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 18:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A1E220672
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 18:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbeLSSg5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 13:36:57 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50263 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbeLSSg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 13:36:57 -0500
Received: by mail-wm1-f68.google.com with SMTP id n190so7093964wmd.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 10:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SeMoYYRoyywUMQiBfYtyiBEqpBgxDAi4Kzp38E75PII=;
        b=n+0WFvlah+NeC+Jf8sUKSsSj/KbRlKv56w1Mn7MCeUEft3Lilsp4zVWGqGmohk+LhN
         PTbN9nJmaOYpcdiekoWxOaVYFKxAsqsh2bBr0WiQYcHqkDqHhlCWw4QhTio0c/8HYBfN
         7uBJskFI+iYn5GqLU9Wj81PLz4GXQrALfDJnK1Py90h6BEk0PG/1X+aY84YA866ZkKCq
         EXRlD8ZHX+mng6NmCzQiEMAjbwE6ommhUyMRiR6y3v28zf4UAM/qGGbV62UIL2sH7ZiZ
         HLrLbUL4ToxPVYZtlLbSIpo1pOzVMGakdukUApgaFtYGV7uMQoDQwGqAKfi1qRGYj6l8
         WGxg==
X-Gm-Message-State: AA+aEWaqa43tPagHxlOSY85t5D8Irx+eHKq/tmUErKujMmtFBZkF5fGm
        kPnEnIWera3fhv+u9gF67yOY6A==
X-Google-Smtp-Source: AFSGD/VrV7Pi1wSTXLqwxHensRMP9RR7G+tFOZrNU2YmaOlCRChdKNz2h7R0BLMxLh3iekUWzbv5SA==
X-Received: by 2002:a1c:d912:: with SMTP id q18mr8153087wmg.122.1545244615827;
        Wed, 19 Dec 2018 10:36:55 -0800 (PST)
Received: from shalem.localdomain (546A5441.cm-12-3b.dynamic.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id x20sm8926562wme.6.2018.12.19.10.36.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 10:36:55 -0800 (PST)
Subject: Re: [PATCH 01/10] i2c: add suspended flag and accessors for i2c
 adapters
To:     Lukas Wunner <lukas@wunner.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
References: <20181219164827.20985-1-wsa+renesas@sang-engineering.com>
 <20181219164827.20985-2-wsa+renesas@sang-engineering.com>
 <20181219172250.ytronxeq2yc4vp4r@wunner.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <83b17734-2437-5a04-8843-e18ccf7ad398@redhat.com>
Date:   Wed, 19 Dec 2018 19:36:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181219172250.ytronxeq2yc4vp4r@wunner.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 19-12-18 18:22, Lukas Wunner wrote:
> On Wed, Dec 19, 2018 at 05:48:17PM +0100, Wolfram Sang wrote:
>> +static inline void i2c_mark_adapter_suspended(struct i2c_adapter *adap)
>> +{
>> +	i2c_lock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
>> +	set_bit(I2C_ALF_IS_SUSPENDED, &adap->locked_flags);
>> +	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
>> +}
> 
> This looks like a duplication of the is_suspended flag in struct dev_pm_info.
> Any reason why you can't use that?  If so, it would be good to document the
> reason in the commit message.

Oh, that is a very good point and that one only gets set on system suspend
and not on resume suspend, working around the problems with the i2c-designware
driver.

I think this might be as simple as adding:

	if (WARN_ON(adap->dev.parent->power.is_suspended))
		return -ESHUTDOWN;

To __i2c_transfer (and document the -ESHUTDOWN) combined with removing
all the now no longer DIY code from various bus drivers.

Regards,

Hans




> 
> If the point is to constrain refusal of transfers in suspended state to
> certain drivers, those drivers could opt in to that functionality by
> setting a flag, and the i2c core could then gate refusal based on
> that flag and the is_suspended flag in struct dev_pm_info.
> 
> Also, why is it necessary to take a lock to perform an atomic bitop?
> (Sorry if that's a dumb question, seems non-obvious to me.)
> 
> Thanks,
> 
> Lukas
> 
