Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:52042 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755310AbeBOKDP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:03:15 -0500
Subject: Re: [PATCH] ARM: shmobile: Document Renesas H2-based Stout DT
 bindings
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20180213232916.31470-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUtVkBPwYKzhEh0WObyMdJs4nk2a2UJ+hHT7cztM62_tw@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <92474baf-d237-dbf3-d8cb-b1c74064f3e3@gmail.com>
Date: Thu, 15 Feb 2018 10:21:43 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUtVkBPwYKzhEh0WObyMdJs4nk2a2UJ+hHT7cztM62_tw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/14/2018 09:16 AM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Wed, Feb 14, 2018 at 12:29 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Document the Renesas H2 Stout (ADAS Starter Kit) device tree bindings,
> 
> Thanks for your patch!
> 
> According to https://elinux.org/images/1/10/StoutTopWithLabels.png,
> it's called "ADAS Starterkit".
> 
>> listing it as a supported board.
>>
>> This allows to use checkpatch.pl to validate .dts files referring to
>> the Stout board.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> 
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
>> index 41d3920aaa5e..bf9bb6eda4a6 100644
>> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
>> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
>> @@ -94,6 +94,8 @@ Boards:
>>      compatible = "renesas,kzm9g", "renesas,sh73a0"
>>    - Lager (RTP0RC7790SEB00010S)
>>      compatible = "renesas,lager", "renesas,r8a7790"
>> +  - Stout (Y-R-CAR-ADAS-SKH2-BOARD)
> 
> Please keep the list alphabetically sorted.
> 
> I'd add "ADAS Starterkit" here, too, cfr. M3ULCB below.

OK

-- 
Best regards,
Marek Vasut
