Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729F2C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30F2320854
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wb7vCqY5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbfCOMG1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 08:06:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50142 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728096AbfCOMG0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 08:06:26 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D49131A;
        Fri, 15 Mar 2019 13:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552651583;
        bh=RNPNbd2srjEJgXfurUkt+LoFo6nzK1Ix/ME13NCRPB0=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=wb7vCqY5xTpMSDciMM3KONIa0uKenfFa0RIi7ILxbxmlkfnG5p+updX8a6/slK3Qr
         yi4YKdbbIr8OSTyHKbevkRe2QO+SKakI/0g4Pk0eG0DcE1MMRZVGS4V2wTU6+WhCr3
         gudxVV15tzqNf4X/zO9fiIjgmI2ITJdtPAZwKwPw=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
To:     Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
 <a3fd63fb-0eec-78f3-992f-84194bf571dd@axentia.se>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <7a48e707-bf06-6a95-e1ba-08e45481715c@ideasonboard.com>
Date:   Fri, 15 Mar 2019 12:06:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <a3fd63fb-0eec-78f3-992f-84194bf571dd@axentia.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On 14/03/2019 10:25, Peter Rosin wrote:
> Hi!
> 
> A comment from the peanut gallery...
> 
> On 2019-03-13 17:55, Wolfram Sang wrote:
>> From: Heiner Kallweit <hkallweit1@gmail.com>
>>
>> i2c_new_dummy is typically called from the probe function of the
>> driver for the primary i2c client. It requires calls to
>> i2c_unregister_device in the error path of the probe function and
>> in the remove function.
>> This can be simplified by introducing a device-managed version.
>>
>> Note the changed error case return value type:
>> i2c_new_dummy returns NULL whilst devm_new_i2c_dummy returns an ERR_PTR.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> [wsa: rename new functions to 'errptr' style and fix minor kdoc issues]
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>  Documentation/driver-model/devres.txt |  3 +++
>>  drivers/i2c/i2c-core-base.c           | 44 +++++++++++++++++++++++++++++++++++
>>  include/linux/i2c.h                   |  3 +++
>>  3 files changed, 50 insertions(+)
>>
>> diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
>> index b277cafce71e..e36dc8041857 100644
>> --- a/Documentation/driver-model/devres.txt
>> +++ b/Documentation/driver-model/devres.txt
>> @@ -266,6 +266,9 @@ GPIO
>>    devm_gpio_request_one()
>>    devm_gpio_free()
>>  
>> +I2C
>> +  devm_i2c_new_dummy_errptr()
>> +
> 
> TL;DR Can we call the new functions
> 
> i2c_register_device
> i2c_register_dummy
> devm_i2c_register_dummy
> 
> or
> 
> i2c_add_device
> i2c_add_dummy
> devm_i2c_add_dummy
> 
> or something? Please?
> 
> I personally really dislike the proposed name. It is akin to the abomination
> where some sort of abbreviation of the types of variables are included also
> in the variable names. It's useless clutter, at least to me.


I hate to be jumping in with just a 'me-too' - but I also had a similar
disliking to the _errptr suffix on the function name here.


A definite +1 for the addition of the devres handling though. That's got
a lot of benefit for the additional client addresses on multi-address
devices.

--
Regards

Kieran


> 
> I can see that you do not want to change the i2c_new_{device,dummy} names
> since they are kind of widespread and I can also see that you want to
> match the devm_ name with the non-devm_ name. So, I see *why* this naming
> is as it is, but I just don't like it.
> 
> I had a look at a couple of the i2c_new_dummy call sites, and some of them
> can be easily updated to simply pass on the PTRERR instead of hardcoding
> INVAL (or something) on NULL, some of them ignore the return value (and are
> thus not able to call i2c_unregister_device correctly) and some are
> different in other ways. In short, it seems that there are plenty of good
> opportunities to update lots of call sites to the new interfaces.
> 
> However, after most of the maintained uses have been updated we are bound
> to have a tail of unmaintained code that will use the old interface. At
> some point, someone might convert the tail of call sites using the old
> NULL-returning functions. At that point we are stuck with a bunch of ugly
> hysterical foo_errptr names. And again it will be a daunting series to
> change them all at once.
> 
> Cheers,
> Peter
> 

-- 
Regards
--
Kieran
