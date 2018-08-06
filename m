Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33594 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbeHFMyS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 08:54:18 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 04/14] arm64: dts: renesas: r8a7795-es1: ulcb-kf: Use
 "renesas,ulcb" compatible
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-5-erosca@de.adit-jv.com> <1889610.CmbOguoUMH@avalon>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <c0315c63-a006-48fd-0565-8addfd82ab48@ideasonboard.com>
Date: Mon, 6 Aug 2018 11:45:46 +0100
MIME-Version: 1.0
In-Reply-To: <1889610.CmbOguoUMH@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent, Eugeniu,

On 06/08/18 11:42, Laurent Pinchart wrote:
> Hi Eugeniu,
> 
> Thank you for the patch.
> 
> On Sunday, 5 August 2018 02:11:04 EEST Eugeniu Rosca wrote:
>> Following the recent change in dt-bindings [1], switch from
>> "renesas,h3ulcb" to "renesas,ulcb" compatible string.
>>
>> [1] Documentation/devicetree/bindings/arm/shmobile.txt
>>
>> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
>> ---
>>  arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
>> b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts index
>> 06deb67c36c8..7a5b1dc64090 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
>> @@ -14,6 +14,6 @@
>>
>>  / {
>>  	model = "Renesas H3ULCB Kingfisher board based on r8a7795 ES1.x";
>> -	compatible = "shimafuji,kingfisher", "renesas,h3ulcb",
>> +	compatible = "shimafuji,kingfisher", "renesas,ulcb",
>>  		     "renesas,r8a7795";
> 
> This is unrelated to your patch, but due to the reason explained in my review 
> of 02/14, I think "shimafuji,kingfisher" should include the SoC name.
> 
> This brings up the topic of how to describe boards that are made of an SoC 
> "module" board plugged into an expansion "motherboard".

Isn't it the point that the shimafuji board is agnostic to the SoC on
the ULCB?

I presume the Kingfisher board is just the expansion board which would
be identical regardless of if it was put on an H3 ULCB, or an M3 ULCB?


> 
>>  };
> 

Regards

Kieran
