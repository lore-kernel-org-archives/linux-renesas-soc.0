Return-Path: <SRS0=Zu5O=OT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5E3C5CFFE
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 22:10:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5A8620821
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 22:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzqIroGI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A8620821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbeLJWKM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 10 Dec 2018 17:10:12 -0500
Received: from mail-pg1-f180.google.com ([209.85.215.180]:47043 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbeLJWKM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 17:10:12 -0500
Received: by mail-pg1-f180.google.com with SMTP id w7so5600723pgp.13;
        Mon, 10 Dec 2018 14:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WbkuC2nausPddEQL+qtbtFQYhQ7ckB6klvXfPRceBBo=;
        b=QzqIroGI37KVPPbH/IINVYffMhWNpEwdTKmq6OgsanSrehKLIRWjpIih3TZeXGKGV7
         +qGMQpoZ3xor4Af7++IUVYKuVp0jfl9LwoJS9SFO9aWEk+TLS3wdvSstvO49cKD+Jn5u
         6lxvZb00f7een5uVDnoRF4OfIFa8nZzs3HIEKV0uWsQgxBO3k4q0sV/6FBWzRyAaQpEf
         ztxmsypFLVDK1FA0ucmV0gxJ+hYxkd8zxjMplONCIl9LxV7yZBVTnRWRTU9WsYAB/DUz
         +ld6lt62Q8+zYAheOZ0Usz6PpGegomEJcu6DkMQpD/CWBcKze17+skYvZxSyNDvB0YdB
         pidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WbkuC2nausPddEQL+qtbtFQYhQ7ckB6klvXfPRceBBo=;
        b=h9WVgkSEb3ks1F/u1E7wZ6y2s/3v9GP0xxuqzfzxC5pCQ84vXKsV4MP3qW95Co0pVj
         w5BAo7dOpaPk+lZPCGBvor+JJC8Ah7X6e9PU2AyuhbKmBXA/V2GS/7oMdx6TgyCvKjH4
         9C0K/CRccs5I0bWm19ltVKEcLdV1pFlMC+mahSJvjRYt9U/9giRvgM+CxQzr/0W4RQIM
         c/ixZwF8z3y9iL6iEU11RDItVj3MU6tiN2mL/F3GRwGipIJoQQDSI9OJziOvC9dzJiII
         zljtpTwnllle6qMaxDjr7iE7kE8skqm6I7xLW9rO8wilLqxNzwoME7+cWKZZFZPQbY8V
         xi/w==
X-Gm-Message-State: AA+aEWZ3dOtGAEg72Op+Cjpjv0NoViGnKrD+3hkXJcKdUluLhdyf3sxL
        NmDtd6+Kpp1k3jkBHyb8zt8=
X-Google-Smtp-Source: AFSGD/Wqm/nz00o0IHjw/iWeuTuoPL1JzDXgZQBoaz483tFve5YvSh+JhT2YFE2v6TWaxm3l3eBHfg==
X-Received: by 2002:a63:d450:: with SMTP id i16mr12170128pgj.246.1544479810583;
        Mon, 10 Dec 2018 14:10:10 -0800 (PST)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net. [24.6.192.50])
        by smtp.gmail.com with ESMTPSA id k26sm30965737pgf.65.2018.12.10.14.10.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 14:10:09 -0800 (PST)
Subject: Re: phandles using absolute paths in DT overlays
To:     David Gibson <david@gibson.dropbear.id.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <CAMuHMdUgYFkYrpnpOdrE5ce-pHSUqLPPs=gheitp5sAnu=srEQ@mail.gmail.com>
 <20181207013513.GV768@umbus.fritz.box>
 <CAMuHMdUdPKb6go3U46fJsWdfDrx057SPem-ZDi9wOJhfaeCENQ@mail.gmail.com>
 <20181210054928.GR4261@umbus.fritz.box>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <0039cd72-2ad1-529e-67b4-44f9eb318d54@gmail.com>
Date:   Mon, 10 Dec 2018 14:10:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181210054928.GR4261@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181210221008.n9so9MjJXtQkIj0QqjxPdVZ-JvlwRZoW65nvk4-6HtQ@z>

Hi Geert,

On 12/9/18 9:49 PM, David Gibson wrote:
> On Fri, Dec 07, 2018 at 09:19:24AM +0100, Geert Uytterhoeven wrote:
>> Hi David,
>>
>> Thanks for your answer!
>>
>> On Fri, Dec 7, 2018 at 2:44 AM David Gibson <david@gibson.dropbear.id.au> wrote:
>>> On Thu, Dec 06, 2018 at 01:56:45PM +0100, Geert Uytterhoeven wrote:
>>>> Some early revisions of SoCs may have hardware bugs that need to be
>>>> fixed up in DT.  Currently we are handling this by including DTS files
>>>> and fixing up nodes and properties, to create different DTB files for
>>>> different SoC revisons (see arch/arm64/boot/dts/renesas/*es1*).
>>>>
>>>> As an alternative, I'm envisioning the use of DT overlays and the
>>>> fdtoverlay tool, in the hope of simplifying the generation of DTBs for
>>>> the various SoC/board combinations.
>>>>
>>>> Ideally, such DTBs would not contain symbols, to avoid inflating DTB
>>>> size.  Hence if fixup overlays would not contain symbolic references,
>>>> there would be no need for symbols.
>>>>
>>>> For anchors, the "&{/path/to/node@address}" syntax is working fine.
>>>> For phandles, while documented on
>>>> https://elinux.org/Device_Tree_Mysteries, and while working fine for the
>>>> non-overlay case, dtc seems to have issues interpreting the DTB:

< snip >

I have updated elinux.org with the limitation for overlays that you report
and that David explained.

-Frank
