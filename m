Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F118C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:50:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6331120672
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VC+4A29v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730788AbeLPUue (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 15:50:34 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45129 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbeLPUud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 15:50:33 -0500
Received: by mail-wr1-f68.google.com with SMTP id t6so10113059wrr.12;
        Sun, 16 Dec 2018 12:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mhu/CbNwLsm1B3BrBDNss+YxowqLlEni9LzCeJ1XXeA=;
        b=VC+4A29vx53P02s1FX01UO7SGapyHQbzo+pgaxssuKHb5SjVjfTtlQ+moZ5LDP7c7u
         5VM3SfwGtR1+b0dYJrwPCYB2hke+OfNyN64XdVS+qFJ+7gJxD9ilnOLM8bAD+iXSUr5v
         lc8sE5dv+j5Myc0m1VCVeanCqX8lB+BeetnUyBiElhm+TKqABAY+AFjQ9eANg/z+ZCwH
         ro2CovTWSM2TeF/CkTV7AJSBZ35Gn+MTiMcYUfG+rltZEMY2fQGdBzzo5lPafm0ddpkc
         TQfqIOaICnIiuf7RrXn1CIgos8yjJ6pAp34zjrkR8z4sy/UrqbdAsLZCA8UxQgCKnkY0
         P3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mhu/CbNwLsm1B3BrBDNss+YxowqLlEni9LzCeJ1XXeA=;
        b=mBXV31lSeKdaBcY0W8Y7QSe72+hbgsRyJftaCdTP9yo+OC4cAx4SlZvNqTER7a1qLV
         zsbWjrOeu/jZ/+1ZyEo8HkRgw0loXM8gm2mWDEu94I9s55UV2Vwl+KgOp03spe7SfW1E
         KrKtbkdW4LVqTQYtBow4xvfWFBtsoQyp72fXmvtaUYtW0yFzSGhgjYWyv0haceJsV5gI
         GM1YU14C6RjbxDtqFzS5GJPzCyQLimPHk6WP0kkeEcO1GRHQ+B+q42mHGEomLuJJpIji
         LDpAIlsHjPn7yg6g9wM0/kE54MIOgyRiZHCy0dxNpNaJMbkPGPjT9WFSm6rq914BInDz
         nbhA==
X-Gm-Message-State: AA+aEWYFWQsg6YXJ971LSL9phxGV1DMyYUZmXs/tHpFg9tJoMEBnfKIY
        Yvd+XYrDlokRuZzyhRoesP8=
X-Google-Smtp-Source: AFSGD/WwgIfixC05K/m92H+P6IIVIoMY2e+323c6KUE6nsiOguekm7F6oGNh8e5pJevoBT06TdibQw==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr8949208wro.262.1544993431470;
        Sun, 16 Dec 2018 12:50:31 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id e19sm20795190wrc.25.2018.12.16.12.50.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Dec 2018 12:50:30 -0800 (PST)
Subject: Re: [PATCH 1/6] thermal: split
 thermal_zone_of_sensor_register{,_param}()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com>
 <20181215172351.GB10311@localhost.localdomain>
 <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com>
 <CAMuHMdWEuiPnZfeNA+T_Gp6W7EAGimrb9Z=rU590OnPz2-MLow@mail.gmail.com>
 <270eeb39-140f-7f55-75d3-c2a6d9ab4034@gmail.com>
 <CAMuHMdUAVYk0Xx56H+V1usFa3627Zk7erewrtP-2HG02neit9A@mail.gmail.com>
 <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com>
 <CAMuHMdUJPLu2H5dYZjFG1oKYOoXiQGE6_S8BFK8c7Nue_Dfqzg@mail.gmail.com>
 <09902cc4-ef25-cd36-0d4a-effeabcd233f@gmail.com>
 <CAMuHMdV4jtF6nqH2RMLpg3gQu5Gok050kW+o0p8fzpZYyv9GAQ@mail.gmail.com>
 <31978c47-cd1b-7c61-0d6a-09e443147b52@gmail.com>
 <CAMuHMdVVoTF0vP_k4Qw8MYqBZEb9ei0LcT2NRJeBRm1tdd4T+Q@mail.gmail.com>
 <04bcb195-0668-4d8d-1f86-c53c3a142183@gmail.com>
 <CAMuHMdUnH5-YeGcQdbyJP2KNZFS=zxhSb7PZ1ZhLCqFxiw=TnQ@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <74305798-9405-4f82-36a6-1f5cc515eaf6@gmail.com>
Date:   Sun, 16 Dec 2018 21:43:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUnH5-YeGcQdbyJP2KNZFS=zxhSb7PZ1ZhLCqFxiw=TnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/16/2018 09:08 PM, Geert Uytterhoeven wrote:
[...]

>>>>> Git actually does that automatically, assumed your user.email config matches
>>>>> the From: address that is used in your outgoing email delivery path (i.e. the
>>>>> scrubbed one, when using Gmail's SMTP server).
>>>>> If you lie to git in your user.email config, git cannot do the right
>>>>> thing, obviously.
>>>>
>>>> My git user.email obviously matches the From: field , before the
>>>> scrubbing, which I believe is the correct thing to do.
>>>
>>> I disagree, because that is not how the emails are actually going out from the
>>> SMTP server you are using.
>>
>> Can you summarize, clearly, what you believe is the right thing to
>> configure and where ?
> 
> According to git-send-email(1), you can either pass your scrubbed email
> address to --from, or configure it in the sendemail.from config option.
> Does that work for you?

So sendemail.from != user.email , the later has the +tag while the
former does not ?

>>>>>> from the same person/email address as the email address in From, so they
>>>>>> are equal.
>>>>>
>>>>> If they differ, they are not equal ;-)
>>>>
>>>> Depends on how you define 'equal' . Here I think foo+bar@example.com
>>>> should be considered equal to foo@example.com .
>>>
>>> That is domain-specific knowledge, which you cannot rely upon.
> 
>>>> Aha, so maybe that enhancement needs further enhancement to scrub the
>>>> +tags before the check ?
>>>
>>> Again, that is domain-specific knowledge, which you cannot rely upon.
>>
>> How so, please elaborate .
> 
> In general, you cannot assume the "+foo" part can be ignored. Only the sender
> knows.

How so ?

-- 
Best regards,
Marek Vasut
