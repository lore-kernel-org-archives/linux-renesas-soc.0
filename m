Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8D0C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 15:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F23120896
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 15:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ep5o4Kcw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbfCYPyC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Mar 2019 11:54:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34243 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbfCYPyC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Mar 2019 11:54:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id j89so8338108ljb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Mar 2019 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CYUC8jP4danihJIpthWKk/igC5st10yy2PrGiXd6jv8=;
        b=ep5o4Kcww+opR6aJ+aKieLSzxNF3h7wQNVCQ6BnPEOJVWAlDrO+q+dVYAwNFkBQt0C
         11rjpqxua3KX+uf7aw8//IpjAdmS31QW8UqfDjRcbPp5MZXrWYkBsUbmOaV63OcMXu8y
         LaV+DqSYvvqoJ4gVXIV0Smru2KE6l0XUZicMFfxxJSSIjzmDNQ3BTuIeIDkhGpYmC8qO
         TW2JyfrpgFuuHk8Rc5kS280Qn/L1LYTs7lQ5ZGeQJ13LF1+bi7nrMheJD31OxG2uml+R
         P0QvlJCROd/xTdMarwd8+LOhFM6GokVPjxanf6MtN1lJAO9E096dPlBxCQsnGvsxs+Mq
         emew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CYUC8jP4danihJIpthWKk/igC5st10yy2PrGiXd6jv8=;
        b=gtdLJEwAvDugqFXDTQUrf8zS1nmNEATCwbhaUyCFoH6goMtinVEasrvVX3Hs7aHRLN
         QMZYX8qyep2T6HOHt4OIGegxxlbVNiWr6OrxO/ZsdeszEc73azLsseQQOVRSCU3gi0hB
         Mb4gR5LvCW3FkDFcPZ9IiVLFjxtSY+2ttqu2c9GZ+AUqtf/UrcalnIquWcskZUx74Y+g
         0OrlicsxxafRi40mj4/EJfroA7PepiYOMNZNnztvwoCmEBYr/a0jq7Yg1pAOsQbyHXse
         tiSyzxsFl8mi0JC6Fka/DH+Os+qMko3yyf9D4/2HfU13YQsucCL7sqzcJp9ktWqgiyGg
         J8ig==
X-Gm-Message-State: APjAAAWm3ShaWeCPLw9pA1HjNXgIIJeChr1aATJAL++OoVZWG7EA6ICf
        Krxjb4jEYoqsy1mgJIlJoUdIFrGaFho=
X-Google-Smtp-Source: APXvYqztJsjW10GAK/BvUgEi60ZCq5bQBGprD2wWhrk528jvOalcSExz+/YVf/0+gfPWzX27OgxfZw==
X-Received: by 2002:a2e:998d:: with SMTP id w13mr23195lji.110.1553529240176;
        Mon, 25 Mar 2019 08:54:00 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.80.246])
        by smtp.gmail.com with ESMTPSA id z26sm3401378lja.33.2019.03.25.08.53.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Mar 2019 08:53:59 -0700 (PDT)
Subject: Re: [PATCH/RFC 00/02] Remove undocumented IMR-LX4 device nodes
To:     Simon Horman <horms@verge.net.au>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Konstantin Kozhevnikov 
        <Konstantin.Kozhevnikov@cogentembedded.com>
References: <154807139502.25511.1919986589060151108.sendpatchset@octo>
 <CAMuHMdUe+Hjn7cJB19OpEt7=Stcj-=gvA1TxH-fEjDpTx1PG1g@mail.gmail.com>
 <CANqRtoTNk7MQuXmoEZ6aTbEbEEOg7t-B63USvjcxKs-7LWggSA@mail.gmail.com>
 <d9f6abfa-e480-cd85-a1a4-0c2ad219200f@cogentembedded.com>
 <20190128125806.s3kjyjejwmtk6zqj@verge.net.au>
 <20190325110358.tpn6phh45dbyv52k@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <cf9d67af-4ac2-613e-0e5f-b69f197811ef@cogentembedded.com>
Date:   Mon, 25 Mar 2019 18:53:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190325110358.tpn6phh45dbyv52k@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 03/25/2019 02:03 PM, Simon Horman wrote:

>>>>> On Mon, Jan 21, 2019 at 12:49 PM Magnus Damm <magnus.damm@gmail.com> wrote:
>>>>>> Remove undocumented IMR-LX4 device nodes
>>>>>>
>>>>>> [PATCH/RFC 01/02] arm64: dts: renesas: r8a7795: Remove IMR-LX4 device nodes
>>>>>> [PATCH/RFC 02/02] arm64: dts: renesas: r8a7796: Remove IMR-LX4 device nodes
>>>>>>
>>>>>> These patches take the easy way out and simply remove the undocumented
>>>>>> IMR-LX4 device nodes from the upstream tree. Good or bad, let me know!
>>>>>>
>>>>>> So perhaps this is a bit overly aggressive but since the DT bindings seem
>>>>>> undocumented and no driver exists in upstream my gut feeling says these DT
>>>>>> nodes were part of an upstreaming attempt that got suspended half-way through.
>>>>>>
>>>>>> In case DT binding documentation is in-flight and queued up somewhere
>>>>>> (ideally together with a driver) then feel free to ignore this series.
>>>>>>
>>>>>> Instead of removing nodes we could also document the DT bindings for the
>>>>>> IMR-LX4 devices. It would also make sense to add device nodes to other
>>>>>> more recent SoCs than just H3 and M3-W. But blindly adding more DT nodes
>>>>>> with a DT binding but without a driver seems a bit suboptimal compared to
>>>>>> testing against an actual driver.
>>>>>
>>>>> [PATCH v5] media: platform: Renesas IMR driver
>>>>> https://lore.kernel.org/linux-renesas-soc/20170309200818.786255823@cogentembedded.com/
>>>>
>>>> Thanks, but that seems to be from 2017! =)
>>>
>>>    I dropped the ball there, as I was tasked with upstreaming V3x support...
>>> The last thing done about the IMR driver was talking to Hans in Prague in
>>> 2017.  I'm planning to return to the driver after I'm done with the
>>> HyperFlash driver.
>>
>> Hi Sergei,
>>
>> I appreciate that we are not always in control of our own priorities,
>> indeed I sympathise with that predicament. However, we shouldn't really
>> be in a situation where DT is making use of undocumented bindings.
>>
>> I would like to ask for the bindings to be documented in the upstream
>> kernel in the near future. And if that is not possible I believe we
>> should consider temporarily removing their use in DT in the upstream kernel.
> 
> Hi Sergei,
> 
> about two months have passed since Magnus posted this series.

   Time flies...
   Dealing w/ the flash drivers turned into unending nightmare. :-(

> Do you have a timeline to address the problems?

   I'm looking into posting the bindings separately right now.
The patch should be ready today or tomorrow.

> If so I believe> that the way forward should be to apply this series.

   Hm, not sure I understood you correctly. You're going to remove
the device nodes even if I have a timeline?

[...]

MBR, Sergei
