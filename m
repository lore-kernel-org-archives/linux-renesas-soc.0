Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E703C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 17:49:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18A482084A
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 17:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQu5emaj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730496AbeLPRtD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 12:49:03 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54609 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730449AbeLPRtD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 12:49:03 -0500
Received: by mail-wm1-f65.google.com with SMTP id a62so10158088wmh.4;
        Sun, 16 Dec 2018 09:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O5HoLvGBzetPz9+XjaAD/NiJrF3j0lzKPcoBck4Glpw=;
        b=ZQu5emajRanrFKoPXV/EL1rubAdr1sa7kfLU2E0U7Ly229DyG5P63u8GLKSOlzhUAn
         zVl/l3z9jQHaBt0ZvAxvBjfDYPcCblDpTuIVz8ibadE5I77ArYKXt5vD/eQ3lJpLoPF4
         FebCgaNCck5g0BAJeSBHIHQH8cuoEYDsbtqTDqdb5LDoUT2HCRtAksmqc3OEujEP6Loc
         zl0IjRpdY9MMlOCoi9Tzfs0xo46y+iH0eX3nqnuYKeIWPZU+9fsxb1HXSBaQ3IUJOnXf
         /RGT/9YR0uPNBQs8CEooN4h2vAxAGV9UKlIOrJ/wM9V5HJfEz6zChUBVojLkBhGHZDHy
         XWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O5HoLvGBzetPz9+XjaAD/NiJrF3j0lzKPcoBck4Glpw=;
        b=ji5qUmOf22JYmusI+R61KXbyIiENXoiaY9gJAbuGnBe4NviUqXmibicinxQtz2Yu4O
         GRsWT3N7qrLxXspJmoWAEDxhTtnNysZRSutCJNp4b/DkJA57XcFc5ZGeti9Mwa1TKzg0
         PFupXOA2bCLRYmFe1hCzdirVNZ+3428pdiaax7YMEhH2RpQvPZfat1YaAu2jHSTTiSzn
         BnFORiXDn42+YyVWE3IueO0EMgyYjO+zhAhjeAsLPXpCGBoFOlp/76O4k/TOuOU+pimn
         yqTLIodA9VsAUQNgmNq7KuFsLq2Giymrozetsr4RmxrnvuXvy38fuzD9u990oCO7FY/2
         IAhw==
X-Gm-Message-State: AA+aEWb5ZwRmEOvPu/+RfVk3QUb5/KPqgcxzRVRZ46R0ESAb/lmsM74o
        3LkixX4d7lE1lWcglCVMWq8=
X-Google-Smtp-Source: AFSGD/WXKKm3vmsPfCOupoq2mi52mfuvOLTNFFRvmhaMPjYsSACXbUn4Hr0Ihqn4kvJKaHKP1GSC2w==
X-Received: by 2002:a1c:90d5:: with SMTP id s204mr9215392wmd.148.1544982540501;
        Sun, 16 Dec 2018 09:49:00 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id x8sm32549066wmd.45.2018.12.16.09.48.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Dec 2018 09:48:59 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <04bcb195-0668-4d8d-1f86-c53c3a142183@gmail.com>
Date:   Sun, 16 Dec 2018 18:48:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVVoTF0vP_k4Qw8MYqBZEb9ei0LcT2NRJeBRm1tdd4T+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/16/2018 06:42 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sun, Dec 16, 2018 at 6:25 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 12/16/2018 09:39 AM, Geert Uytterhoeven wrote:
>>> On Sat, Dec 15, 2018 at 9:13 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> On 12/15/2018 09:00 PM, Geert Uytterhoeven wrote:
>>>>> On Sat, Dec 15, 2018 at 8:07 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>>>> On 12/15/2018 07:54 PM, Geert Uytterhoeven wrote:
>>>>>>> On Sat, Dec 15, 2018 at 7:49 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>>>>>> On 12/15/2018 07:47 PM, Geert Uytterhoeven wrote:
>>>>>>>>> On Sat, Dec 15, 2018 at 7:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>>>>>>>> On 12/15/2018 06:23 PM, Eduardo Valentin wrote:
>>>>>>>>>>> On Wed, Dec 12, 2018 at 02:49:22AM +0100, Marek Vasut wrote:
>>>>>>>>>>>> Introduce new thermal_zone_of_sensor_register_params() function, which
>>>>>>>>>>>> allows passing struct thermal_zone_params into it and convert original
>>>>>>>>>>>> thermal_zone_of_sensor_register() to call it with params set to NULL.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>>>>>>>
>>>>>>>>>>> Git complains about mismatch between From: and this SOB.
>>>>>>>>>>
>>>>>>>>>> I recall a discussion about gmail stripping the +foo tags from email
>>>>>>>>>> addresses. I can add a From: tag into the patch to override this
>>>>>>>>>> braindeath, or is there a better solution ?
>>>>>>>>>
>>>>>>>>> Run the "git format-patch" command from a git repo where user.email
>>>>>>>>> is marek.vasut@gmail.com, so it will retain the original From: tag in the
>>>>>>>>> email body, as it is different?
>>>>>>>>
>>>>>>>> I can also manually patch the From tags or add them, but it's all
>>>>>>>> workarounds.
>>>>>>>
>>>>>>> Use a different outgoing email server? I use my ISP's.
>>>>>>
>>>>>> Or maybe it'd make sense to fix git to handle the +tags correctly ?
>>>>>
>>>>> What needs to be fixed?
>>>>> If user.email != From, git format-patch generates a From: header, else
>>>>> it doesn't. Doesn't that make sense?
>>>>
>>>> I believe the complaint here is that email address in From does not
>>>> match email address in SoB line, because some SMTP servers scrub the
>>>> +foo tag from From: and not from SoB-line . And yet, the SoB line is
>>>
>>> Some SMTP servers (Hi Gmail!) scrub the +foo tag from the From: _header_
>>> in the email. As the SoB is in the _body_ it is not affected.
>>> Hence the solution is to include the correct From: in the _body_.
>>
>> This is basically what I said.
>>
>>> Git actually does that automatically, assumed your user.email config matches
>>> the From: address that is used in your outgoing email delivery path (i.e. the
>>> scrubbed one, when using Gmail's SMTP server).
>>> If you lie to git in your user.email config, git cannot do the right
>>> thing, obviously.
>>
>> My git user.email obviously matches the From: field , before the
>> scrubbing, which I believe is the correct thing to do.
> 
> I disagree, because that is not how the emails are actually going out from the
> SMTP server you are using.

Can you summarize, clearly, what you believe is the right thing to
configure and where ?

>>>> from the same person/email address as the email address in From, so they
>>>> are equal.
>>>
>>> If they differ, they are not equal ;-)
>>
>> Depends on how you define 'equal' . Here I think foo+bar@example.com
>> should be considered equal to foo@example.com .
> 
> That is domain-specific knowledge, which you cannot rely upon.
> 
>>> While many mail servers ignore +foo when delivering email to mailboxes,
>>> this is not the case for all of them.  So ignoring +foo is not the universal
>>> solution.
>>>
>>>> I think git should just ignore the +foo tag in SoB line.
>>>
>>> Where should "git" ignore the +foo tag? Is it actually git that complains?
>>> Eduardo: Do you mean checkpatch? ;-)
>>
>> Possibly. I ran checkpatch after git format-patch and it didn't complain.
>>
>>> I did enhance checkpatch with a check to verify that patches carry SoB tags
>>> from their authors, as too many people got that wrong, causing complaints
>>> from sfr in linux-next later. As usual, it's better to get things right as early
>>> as possible in the process, to avoid rework.
>>
>> Aha, so maybe that enhancement needs further enhancement to scrub the
>> +tags before the check ?
> 
> Again, that is domain-specific knowledge, which you cannot rely upon.

How so, please elaborate .

>>> So the problem is on the patch sending side, not on the patch verification
>>> receiving side.
>>> Hence please fix your email setup, thanks!
>>
>> See above.
> 
> How is any of this different from people making mistakes trying to send
> patches through a not-to-be-named corporate email system?

I lost you here.

-- 
Best regards,
Marek Vasut
