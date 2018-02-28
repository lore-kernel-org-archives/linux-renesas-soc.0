Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35133 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751617AbeB1Hin (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Feb 2018 02:38:43 -0500
Received: by mail-lf0-f65.google.com with SMTP id 70so2062502lfw.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2018 23:38:43 -0800 (PST)
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Renesas V3MSK and Wheat
 board part numbers
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20180228064911.vnax4vyqnq6lry52@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4a2ae4c8-4a4b-1ea3-3416-2dfdffee6499@cogentembedded.com>
Date: Wed, 28 Feb 2018 10:38:40 +0300
MIME-Version: 1.0
In-Reply-To: <20180228064911.vnax4vyqnq6lry52@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2/28/2018 9:49 AM, Simon Horman wrote:

[...]

>> On Tue, Feb 27, 2018 at 9:17 AM, Simon Horman <horms@verge.net.au> wrote:
>>> On Mon, Feb 26, 2018 at 07:03:43PM +0100, Geert Uytterhoeven wrote:
> 
> ...
> 
>>>> -  - Wheat
>>>> +  - Wheat (RTP0RC7792ASKB0010JE)
>>>>       compatible = "renesas,wheat", "renesas,r8a7792"
>>>
>>> I'm unable to confirm the above. Can anyone help?
>>
>> https://elinux.org/R-Car/Boards/Wheat
>>
>> Looks like I misinterpreted the pictures, and
>> RTP0RC7792ASKB0000JE is the correct part number for Wheat.
> 
> Thanks. I've applied the following.
> 
> 
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH] dt-bindings: arm: Document Renesas V3MSK and Wheat board part
>   numbers
> 
> The DT binding documentation for the Renesas V3MSK and Wheat boards
> lacked board part numbers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> [simon: corrected Wheat part number]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>   Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index a99359e63b0a..66edc1406bb8 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -120,9 +120,9 @@ Boards:
>       compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
>     - Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
>       compatible = "renesas,stout", "renesas,r8a7790"
> -  - V3MSK
> +  - V3MSK (Y-ASK-RCAR-V3M-WS10)

    https://elinux.org/R-Car/Boards/V3MSK (now that I'm reminded of this site) 
says the V3MSK's model # is RTP0RC77970SEB0010S.

>       compatible = "renesas,v3msk", "renesas,r8a77970"
> -  - Wheat
> +  - Wheat (RTP0RC7792ASKB0000JE)
>       compatible = "renesas,wheat", "renesas,r8a7792"

MBR, Sergei
