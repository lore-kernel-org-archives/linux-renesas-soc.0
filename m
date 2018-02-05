Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180205060732.ufy2w37uc4okclew@rob-hp-laptop>
References: <1517240748-14780-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1517240748-14780-6-git-send-email-ulrich.hecht+renesas@gmail.com> <20180205060732.ufy2w37uc4okclew@rob-hp-laptop>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 Feb 2018 08:56:34 +0100
Message-ID: <CAMRc=Mf+g6HNnu1ARPg8Uk9oeLQ+JkJcZrw_H48LzKByp_CM_Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: at24: add bindings for Rohm BR24T01
To: Rob Herring <robh@kernel.org>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>, geert@linux-m68k.org,
        kieran.bingham@ideasonboard.com, Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

2018-02-05 7:07 GMT+01:00 Rob Herring <robh@kernel.org>:
> On Mon, Jan 29, 2018 at 04:45:48PM +0100, Ulrich Hecht wrote:
>> Both manufacturer and name variant.
>>
>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/eeprom/at24.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
>>
>> diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
>> index 1812c84..dd29937 100644
>> --- a/Documentation/devicetree/bindings/eeprom/at24.txt
>> +++ b/Documentation/devicetree/bindings/eeprom/at24.txt
>> @@ -40,6 +40,7 @@ Required properties:
>>                  "microchip",
>>                  "ramtron",
>>                  "renesas",
>> +                "rohm",
>
> This is going to comflict with a patch sorting these IIRC. So they
> should go thru the same tree.
>
>>                  "nxp",
>>                  "st",
>>
>> @@ -47,6 +48,7 @@ Required properties:
>>                  variants of the above. Known such exceptions are listed below:
>>
>>                  "renesas,r1ex24002" - the fallback is "atmel,24c02"
>> +                "rohm,br24t01" - the fallback is "atmel,24c01"
>>
>>    - reg: The I2C address of the EEPROM.
>>
>> --
>> 2.7.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

AT24 patches go through Wolfram's tree, but since he already sent his
PR for 4.16, I can pick them up for 4.17 (except for Peter's sorting
patch which should go in after 4.16-rc1).

Thanks,
Bartosz
