Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD068C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:57:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 824A3206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rsaqS3A4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388017AbeLQP5Q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:57:16 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42951 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387739AbeLQP5Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:57:16 -0500
Received: by mail-wr1-f68.google.com with SMTP id q18so12801928wrx.9;
        Mon, 17 Dec 2018 07:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fiavUIgLh0Z8UU0qneSCbqEUpYScR4sZs+O3+u9G0u8=;
        b=rsaqS3A4Md5EpUb+LxKGoZyiLR/FfcoRaMzxsR75G0BW5JQoc9N30VTL58ClFnYN1p
         5k9T17VUTd7jld4RBdF+13Ll7mm2IdVIQKfCAocp/NJjZMw5VdaQHqbf1UjUm7IIBMdF
         /dFrIBWJENiA28khcZ5Gm5bwBP1/tj73NM+dCyjMuRsWImjSYYu3k119kIa81+D+F8Yq
         bQuQ0Q9HnkKBPAdt4+Vub0fSSpVUQUijRSSZdXjSYDSclIT/IbppDbcUl+qzaV11ssSo
         TF/JUu0B+r/V4ZMZEP1P0ybUemE2rOaba1YJttqsCjNqjhImlH5oALFtNgyLJUgOkC1H
         qDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fiavUIgLh0Z8UU0qneSCbqEUpYScR4sZs+O3+u9G0u8=;
        b=rfm8coIrK8YVWWH24P80oiMnKLePXGRYa9m/kbdaDrOnx3JX6esNI4zC4sBhapvzu0
         Z/a0t2za3kw8J1ph+9wp3rUoFbYu2EzMmdkUSpgrWNTvkZbTUyBOPYhHdirpluh6EJJy
         RiHujH96leKmPmxVGOBzHyqFZWzyTa8rgEGDUGBMolKpzSlOcetCqcdYYzOnXZDagRSx
         W8uzsZHq5uwTRkEyluVOElBjmqycikpIFUt5fyedlgda8u+As9pNVfy+TkfQ5rUJNE29
         xxhcLqCajVIQxq2a8Aau+7oRxueK+f2zFRDyMkNIMwJNYo1Wpc99xxaYZDD0CL0z7kz+
         rz6A==
X-Gm-Message-State: AA+aEWbCkCoxn9zNoEwsy43ZGo4N7YUsRreNpkwAZ95GEJiXvjov2UBE
        ru7mhyW3gcQNOKy0802RTng=
X-Google-Smtp-Source: AFSGD/X0Ufr7UxO5hxAT45UA/zfIJY1fU7tsfJyPmFS8+XrNUvuMzqg7muXROiRbMddeZT73veLrBg==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr11658440wro.262.1545062233315;
        Mon, 17 Dec 2018 07:57:13 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id z17sm870869wrv.2.2018.12.17.07.57.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 07:57:12 -0800 (PST)
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
 <CAMuHMdUAVYk0Xx56H+V1usFa3627Zk7erewrtP-2HG02neit9A@mail.gmail.com>
 <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com>
 <CAMuHMdUJPLu2H5dYZjFG1oKYOoXiQGE6_S8BFK8c7Nue_Dfqzg@mail.gmail.com>
 <09902cc4-ef25-cd36-0d4a-effeabcd233f@gmail.com>
 <CAMuHMdV4jtF6nqH2RMLpg3gQu5Gok050kW+o0p8fzpZYyv9GAQ@mail.gmail.com>
 <31978c47-cd1b-7c61-0d6a-09e443147b52@gmail.com>
 <CAMuHMdVVoTF0vP_k4Qw8MYqBZEb9ei0LcT2NRJeBRm1tdd4T+Q@mail.gmail.com>
 <04bcb195-0668-4d8d-1f86-c53c3a142183@gmail.com>
 <CAMuHMdUnH5-YeGcQdbyJP2KNZFS=zxhSb7PZ1ZhLCqFxiw=TnQ@mail.gmail.com>
 <74305798-9405-4f82-36a6-1f5cc515eaf6@gmail.com>
 <CAMuHMdWUNiCf8GXGq-cThF+h8JwQv6ZQJEC5D4vqQ=AF-9GsOw@mail.gmail.com>
 <726916ff-c2d8-374c-a69d-8b19f9a251b5@gmail.com>
 <CAMuHMdX-qh_LGG8=qZHusp8oMZcOT9dqeoFbBBrpjuOxHAkxxA@mail.gmail.com>
 <a319bd27-bb28-a149-8f04-021c56d13781@gmail.com>
 <CAMuHMdV4XLycZ1hw_Mvm9yFZaM0e2Ex5hABv-tbpMDUakO4JQg@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f504fb5d-3dd9-c0e7-da3f-cdf783f84493@gmail.com>
Date:   Mon, 17 Dec 2018 16:52:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV4XLycZ1hw_Mvm9yFZaM0e2Ex5hABv-tbpMDUakO4JQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/17/2018 03:15 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Mon, Dec 17, 2018 at 2:41 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 12/17/2018 02:36 PM, Geert Uytterhoeven wrote:
>>> On Mon, Dec 17, 2018 at 2:28 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> On 12/17/2018 02:26 PM, Geert Uytterhoeven wrote:
>>>>> On Sun, Dec 16, 2018 at 9:50 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>>>> On 12/16/2018 09:08 PM, Geert Uytterhoeven wrote:
>>>>>> [...]
>>>>>>
>>>>>>>>>>> Git actually does that automatically, assumed your user.email config matches
>>>>>>>>>>> the From: address that is used in your outgoing email delivery path (i.e. the
>>>>>>>>>>> scrubbed one, when using Gmail's SMTP server).
>>>>>>>>>>> If you lie to git in your user.email config, git cannot do the right
>>>>>>>>>>> thing, obviously.
>>>>>>>>>>
>>>>>>>>>> My git user.email obviously matches the From: field , before the
>>>>>>>>>> scrubbing, which I believe is the correct thing to do.
>>>>>>>>>
>>>>>>>>> I disagree, because that is not how the emails are actually going out from the
>>>>>>>>> SMTP server you are using.
>>>>>>>>
>>>>>>>> Can you summarize, clearly, what you believe is the right thing to
>>>>>>>> configure and where ?
>>>>>>>
>>>>>>> According to git-send-email(1), you can either pass your scrubbed email
>>>>>>> address to --from, or configure it in the sendemail.from config option.
>>>>>>> Does that work for you?
>>>>>>
>>>>>> So sendemail.from != user.email , the later has the +tag while the
>>>>>> former does not ?
>>>>>
>>>>> Right.
>>>>>
>>>>>>>>>>>> from the same person/email address as the email address in From, so they
>>>>>>>>>>>> are equal.
>>>>>>>>>>>
>>>>>>>>>>> If they differ, they are not equal ;-)
>>>>>>>>>>
>>>>>>>>>> Depends on how you define 'equal' . Here I think foo+bar@example.com
>>>>>>>>>> should be considered equal to foo@example.com .
>>>>>>>>>
>>>>>>>>> That is domain-specific knowledge, which you cannot rely upon.
>>>>>>>
>>>>>>>>>> Aha, so maybe that enhancement needs further enhancement to scrub the
>>>>>>>>>> +tags before the check ?
>>>>>>>>>
>>>>>>>>> Again, that is domain-specific knowledge, which you cannot rely upon.
>>>>>>>>
>>>>>>>> How so, please elaborate .
>>>>>>>
>>>>>>> In general, you cannot assume the "+foo" part can be ignored. Only the sender
>>>>>>> knows.
>>>>>>
>>>>>> How so ?
>>>>>
>>>>> It depends on the domain.
>>>>>
>>>>> Is Bill.Gates@microsoft.com the same email address as
>>>>> Bill.Gates+foo@microsoft.com?
>>>>> Is Bill.Gates+1955@microsoft.com the same?
>>>>> Is Bill.Gates-1955@microsoft.com the same?
>>>>>
>>>>> I don't know. Only microsoft.com knows.
>>>>> So that's why you should compare email addresses verbatim (but case
>>>>> insensitive).
>>>>
>>>> Oh, you mean email-domain. In that case, since gmail treats
>>>> foo@gmail.com the same as foo+bar@gmail.com , checkpatch should treat
>>>> them equally as well. In which case, your checkpatch patch which now
>>>> generates a warning on this is wrong ?
>>>
>>> So checkpatch should know about all email domains?
>>
>> If correct handling is domain specific knowledge, as you just said,
>> apparently so.
> 
> Are you serious?

That's what the discussion would imply.

>> Otherwise checkpatch produces false positives.
> 
> Even with gmail, some companies may use a single gmail account for public
> development, and use the +foo to distinguish between individual developers.
> So you cannot ignore it.

Hm, that's a rather warped example, but I guess one can use it like so.

>>> Just fix your setup. All patch statistics operate on the author, incl. +foo, so
>>> your patches will be attributed wrongly.
>>
>> Well your suggestion with sendemail.from doesn't seem to change
>> anything, but I'll keep it in.
> 
> Sorry to hear that.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Best regards,
Marek Vasut
