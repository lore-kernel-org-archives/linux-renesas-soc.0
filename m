Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: display: bridge: Document
 THC63LVD1024 LVDS decoder
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, <architt@codeaurora.org>,
        <a.hajda@samsung.com>, <Laurent.pinchart@ideasonboard.com>,
        <airlied@linux.ie>, <horms@verge.net.au>, <magnus.damm@gmail.com>,
        <geert@linux-m68k.org>, <niklas.soderlund@ragnatech.se>,
        <sergei.shtylyov@cogentembedded.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
References: <1523357590-3841-1-git-send-email-jacopo+renesas@jmondi.org>
 <1523357590-3841-2-git-send-email-jacopo+renesas@jmondi.org>
 <29caaf6f-1783-9b01-5304-8748398d41c6@mentor.com>
CC: <dri-devel@lists.freedesktop.org>,
        <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <55ac6669-3dc6-8c6f-d9a0-f6c44f7f0953@mentor.com>
Date: Thu, 19 Apr 2018 12:48:51 +0300
MIME-Version: 1.0
In-Reply-To: <29caaf6f-1783-9b01-5304-8748398d41c6@mentor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On 04/19/2018 12:44 PM, Vladimir Zapolskiy wrote:
> Hi Jacopo, Laurent,
> 
> On 04/10/2018 01:53 PM, Jacopo Mondi wrote:
>> Document Thine THC63LVD1024 LVDS decoder device tree bindings.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
>> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> 
>> ---
>>  .../bindings/display/bridge/thine,thc63lvd1024.txt | 60 ++++++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
>> new file mode 100644
>> index 0000000..0b23e70
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
>> @@ -0,0 +1,60 @@
>> +Thine Electronics THC63LVD1024 LVDS decoder
>> +-------------------------------------------
>> +
>> +The THC63LVD1024 is a dual link LVDS receiver designed to convert LVDS streams
>> +to parallel data outputs. The chip supports single/dual input/output modes,
>> +handling up to two LVDS input streams and up to two digital CMOS/TTL outputs.
>> +
>> +Single or dual operation mode, output data mapping and DDR output modes are
>> +configured through input signals and the chip does not expose any control bus.
>> +
>> +Required properties:
>> +- compatible: Shall be "thine,thc63lvd1024"
>> +- vcc-supply: Power supply for TTL output, TTL CLOCKOUT signal, LVDS input,
>> +  PPL and digital circuitry
>> +
>> +Optional properties:
>> +- powerdown-gpios: Power down GPIO signal, pin name "/PDWN". Active low
> 

sorry for a follow-up, I've just noticed it, could you please double check
spelling PDWN vs PWDN? Thank you in advance.

--
With best wishes,
Vladimir
