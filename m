Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f169.google.com ([209.85.217.169]:45171 "EHLO
        mail-ua0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751453AbdINPA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2017 11:00:26 -0400
Received: by mail-ua0-f169.google.com with SMTP id c27so3923965uah.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Sep 2017 08:00:26 -0700 (PDT)
Subject: Re: [PATCH v2 01/18] dt: arm: shmobile: add M3ULCB Kingfisher board
 DT bindings
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1505398720-4535-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdXtp0w071eAes0Khpi4jHkkgpZ36vbnReGsNWZ-73qa0g@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <0bbc8962-c7f3-3889-1add-9984fa8cea88@cogentembedded.com>
Date: Thu, 14 Sep 2017 18:00:23 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXtp0w071eAes0Khpi4jHkkgpZ36vbnReGsNWZ-73qa0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 14.09.2017 17:55, Geert Uytterhoeven wrote:
> Hi Vladimir,
>
> On Thu, Sep 14, 2017 at 4:18 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
>> Add M3ULCB Kingfisher Device tree bindings Documentation, listing it as a
>> supported board.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> ---
>> Changes in version 2:
>> - added own compatible value "shimafuji,kingfisher"
> Thanks for the update!
>
>> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
>> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
>> @@ -85,6 +85,8 @@ Boards:
>>       compatible = "renesas,lager", "renesas,r8a7790"
>>     - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
>>       compatible = "renesas,m3ulcb", "renesas,r8a7796";
>> +  - M3ULCB Kingfisher (SBEV-RCAR-KF-M03)
>> +    compatible = "shimafuji,kingfisher", "renesas,m3ulcb", "renesas,r8a7796";
>>     - Marzen (R0P7779A00010S)
>>       compatible = "renesas,marzen", "renesas,r8a7779"
>>     - Porter (M2-LCDP)
> As Kingfisher is an extension board, I meant to have a separate entry for it,
> not tied to M3ULCB or H3ULCB:
>
>    - M3ULCB Kingfisher (SBEV-RCAR-KF-M03)
>      compatible = "shimafuji,kingfisher"
>
> That way you don't need to list it twice (the board part number is the same
> for M3ULCB Kingfisher and H3ULCB Kingfisher anyway).
> Do you agree?
Sorry for misunderstanding.

Do you mean to add such entry:

   - Kingfisher (SBEV-RCAR-KF-M03)
     compatible = "shimafuji,kingfisher"


-- 
Regards,
Vladimir
