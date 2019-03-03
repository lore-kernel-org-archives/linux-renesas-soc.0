Return-Path: <SRS0=QYV/=RG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A272FC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 16:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6DF0020857
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 16:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbUa24pa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfCCQIz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 3 Mar 2019 11:08:55 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36001 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfCCQIy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Mar 2019 11:08:54 -0500
Received: by mail-wr1-f68.google.com with SMTP id o17so2855078wrw.3;
        Sun, 03 Mar 2019 08:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z9oMT6T0TZ1vIgZDxpCLL9QXh8Vl2+w09ExBvORaI9Y=;
        b=NbUa24pahfzZxM+hsMs1xPJTXBWEW8W45XKj1UvbzryzOBAFpNLd1mCyhEoeZT7z1k
         YhB42J05Iy4xLRNTHtePMENmKTDK6l/0LqPFi3TrwuLQhhPJkbXchzK6aXRKJWJLbNCS
         KxJHGnKD3Totk4K7zwEcJt0ZGghtjW9s9rw3FD6IdMTZgo0zP6PdJeDkg2lhyk3+02/F
         aWAuKgIczTQS32WB2QC4EZUS17qJvxFGHvSqI4FLljGqYyKXoTbR4DaAbiAeoMr4QtTC
         aKH8ByhPiZqS+ZIzIRECPAVdWCgTpVC2frgDk2B0BNacSiTUttVtXbDmGXXrkS4APBkd
         evMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z9oMT6T0TZ1vIgZDxpCLL9QXh8Vl2+w09ExBvORaI9Y=;
        b=KeRckQ7jmT2mlSM9nSPSBoV0rhMwSKn/XM8dNdFmNWk9AWCrA6XWjTcKPWLnVyTqI8
         T0pEoh7aiuxPW816SY2WRfbvdMdIAMD3L773JqcShnLu6HCTueEB7JcKm5Ka9ZleXmpi
         Hxjk0sMTxCVhExbGDuwGd4rpTEOU53N/68NkNy80LefL/CufqbGds/CkCFk7wq8afHIF
         mR72pCsdWEUKXE+f2pregCwDT/Su6+20KzEKlvt1vLV+nVvNGz1ZmWP3ZAbB4Vyfh1qr
         mFe68iscZ/9MzW6rKX5xWitYGh+PQtSiBFCvTd/TPtpfMQP2HYFGMsi4w1ztmUYWdQr8
         mwtA==
X-Gm-Message-State: APjAAAUCZ/+2Ql6MLmWLbEcN7kRl1lvkrnGzhQ0rl3x2ctk3O9v2bOXi
        e7lDQZE6Ak6whw0tIdrBjokDEGcd
X-Google-Smtp-Source: APXvYqwcQCcbaOL27LvL+o2KRiOjQprv2bRdtfMaSUzAD8u/TVFc2Nu1iRrGSax/YlwCKIf3p2hUeQ==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr9818229wrm.61.1551629332316;
        Sun, 03 Mar 2019 08:08:52 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id w10sm5102718wru.5.2019.03.03.08.08.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Mar 2019 08:08:51 -0800 (PST)
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
To:     Harald Geyer <harald@ccbib.org>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
 <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
 <75846117-242c-6861-ace5-dccf88711208@gmail.com>
 <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at>
 <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
 <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at>
 <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com>
 <E1gvrEx-0000K7-Ks@stardust.g4.wien.funkfeuer.at>
 <72363317-8259-eda2-4cd8-4f336f0c155f@gmail.com>
 <E1gw2Ll-0000MN-40@stardust.g4.wien.funkfeuer.at>
 <fc83b1ce-52e5-b197-4679-69b576233726@gmail.com>
 <E1h0TeF-0000Iw-72@stardust.g4.wien.funkfeuer.at>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <4a719e8b-7d33-0370-e119-d699e0430d77@gmail.com>
Date:   Sun, 3 Mar 2019 17:08:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <E1h0TeF-0000Iw-72@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/3/19 5:07 PM, Harald Geyer wrote:
> Marek Vasut writes:
>> On 2/19/19 11:10 AM, Harald Geyer wrote:
>>> Marek Vasut writes:
>>>> On 2/18/19 11:18 PM, Harald Geyer wrote:
>>>>> From the explanations provided by Mark it is clear that this property
>>>>> is an artifact of the implementation in linux. I think we should document
>>>>> is as such. How about:
>>>>>
>>>>> gpios-states : On operating systems, that don't support reading back gpio
>>>>> 	       values in output mode (most notably linux), this array
>>>>> 	       provides the state of GPIO pins set when requesting them
>>>>> 	       from the gpio controller.
>>>>
>>>> That's good.
>>>>
>>>>> Systems, that are capable of
>>>>> 	       preserving state when requesting the lines, are free to
>>>>> 	       ignore this property.
>>>>
>>>> Are they ?
>>>
>>> I think so. Also this seems to be what Mark wrote yesterday:
>>>
>>> | With the GPIO API as it stands it is unfortunately not possible to
>>> | preserve the state, if the API were fixed we'd preserve state.
>>>
>>>> I think there are systems which depend on preconfiguring the
>>>> GPIO according to this property.
>>>
>>> These systems need to preconfigure the GPIOs in firmware anyway, so
>>> they should be fine so long as the driver preserves state.
>>>
>>> Since the original wording doesn't give any guarantees, I think the
>>> new wording doesn't change anything. It just makes it clearer, that
>>> there are no guarantees and that some drivers will happily overwrite
>>> state when this property is absent.
>>
>> OK, so how can we move forward with this ? We discussed a lot, but I
>> don't know what we should do about the patch.
> 
> Yes, we discussed a lot. I guess most people lost track of where we
> stand. I'd suggest you send a V2 of the patch, picking up all the proposed
> changes. If you feel the part about `gpios-states' property is too
> controversial, then maybe split it in two patches: The first containing
> the non-controversial changes and the second improving `gpios-states'
> description, so that maintainers can ACK them independently.

Well what are the proposed changes ? I don't think there was any
agreement on them.

-- 
Best regards,
Marek Vasut
