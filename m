Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4819C67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 07:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58DBF2054F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 07:40:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qWA9elHQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58DBF2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbeLNHkC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 02:40:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48764 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbeLNHkC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 02:40:02 -0500
Received: from [192.168.0.21] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4048549;
        Fri, 14 Dec 2018 08:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544773199;
        bh=M1f5hCg48gr+4DKdrI09So/s/rHYLDdDSKxcfIppuTg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=qWA9elHQEo4l3U2NjP1W031PDTjIjh6jM42kLhIzvaGSbs+CLGk32YANlDh61ONym
         IPY0seNYVxXX+1dEpnPZK2MY+ZjhUHq1WA4IPh9ukjKCPDuB7dFlZwQmdUENAOLnMd
         DTCZCuBr734mlTOIKdVwU6f0+qaC1bDEps5NsrYc=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Convert live DT patches to sugar syntax
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20181129105850.10953-1-geert+renesas@glider.be>
 <1754701.jL1l6Xu3AY@avalon>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <a11c8c6f-533d-df5f-85df-694c7441f579@ideasonboard.com>
Date:   Fri, 14 Dec 2018 07:39:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1754701.jL1l6Xu3AY@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 29/11/2018 12:43, Laurent Pinchart wrote:
> Hi Geert,
> 
> Thank you for the patch.
> 
> On Thursday, 29 November 2018 12:58:50 EET Geert Uytterhoeven wrote:
>> Using overlay sugar syntax makes the DTS files easier to read (and
>> write).
>>
>> Overlay syntactic sugar for generating target-path fragments is
>> supported by the version of dtc supplied with the kernel since commit
>> 50aafd60898a8b3e ("scripts/dtc: Update to upstream version
>> v1.4.6-21-g84e414b0b5bc").
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> The generated dtbs before/after are identical.
> 
> I was going to ask whether you had tested the patch, but this should be good 
> enough :-)
> 
> The result is nicer to read, thanks.
> 

I agree!

FWIW:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> and taken in my tree.

I was hoping to reference this patch - but I can't see it in a tree
anywhere.

Is there a branch/repo that this is available in now?

--
Regards

Kieran

> 
>> ---
>>  .../drm/rcar-du/rcar_du_of_lvds_r8a7790.dts   | 93 +++++++++----------
>>  .../drm/rcar-du/rcar_du_of_lvds_r8a7791.dts   | 53 +++++------
>>  .../drm/rcar-du/rcar_du_of_lvds_r8a7793.dts   | 53 +++++------
>>  .../drm/rcar-du/rcar_du_of_lvds_r8a7795.dts   | 53 +++++------
>>  .../drm/rcar-du/rcar_du_of_lvds_r8a7796.dts   | 53 +++++------
>>  5 files changed, 135 insertions(+), 170 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
>> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts index
>> 579753e04f3b3712..8bee4e787a0ab4eb 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
>> @@ -7,70 +7,63 @@
>>
>>  /dts-v1/;
>>  /plugin/;
>> -/ {
>> -	fragment@0 {
>> -		target-path = "/";
>> -		__overlay__ {
>> -			#address-cells = <2>;
>> -			#size-cells = <2>;
>>
>> -			lvds@feb90000 {
>> -				compatible = "renesas,r8a7790-lvds";
>> -				reg = <0 0xfeb90000 0 0x1c>;
>> +&{/} {
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>>
>> -				ports {
>> -					#address-cells = <1>;
>> -					#size-cells = <0>;
>> +	lvds@feb90000 {
>> +		compatible = "renesas,r8a7790-lvds";
>> +		reg = <0 0xfeb90000 0 0x1c>;
>>
>> -					port@0 {
>> -						reg = <0>;
>> -						lvds0_input: endpoint {
>> -						};
>> -					};
>> -					port@1 {
>> -						reg = <1>;
>> -						lvds0_out: endpoint {
>> -						};
>> -					};
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				lvds0_input: endpoint {
>>  				};
>>  			};
>> -
>> -			lvds@feb94000 {
>> -				compatible = "renesas,r8a7790-lvds";
>> -				reg = <0 0xfeb94000 0 0x1c>;
>> -
>> -				ports {
>> -					#address-cells = <1>;
>> -					#size-cells = <0>;
>> -
>> -					port@0 {
>> -						reg = <0>;
>> -						lvds1_input: endpoint {
>> -						};
>> -					};
>> -					port@1 {
>> -						reg = <1>;
>> -						lvds1_out: endpoint {
>> -						};
>> -					};
>> +			port@1 {
>> +				reg = <1>;
>> +				lvds0_out: endpoint {
>>  				};
>>  			};
>>  		};
>>  	};
>>
>> -	fragment@1 {
>> -		target-path = "/display@feb00000/ports";
>> -		__overlay__ {
>> -			port@1 {
>> -				endpoint {
>> -					remote-endpoint = <&lvds0_input>;
>> +	lvds@feb94000 {
>> +		compatible = "renesas,r8a7790-lvds";
>> +		reg = <0 0xfeb94000 0 0x1c>;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				lvds1_input: endpoint {
>>  				};
>>  			};
>> -			port@2 {
>> -				endpoint {
>> -					remote-endpoint = <&lvds1_input>;
>> +			port@1 {
>> +				reg = <1>;
>> +				lvds1_out: endpoint {
>>  				};
>>  			};
>>  		};
>>  	};
>>  };
>> +
>> +&{/display@feb00000/ports} {
>> +	port@1 {
>> +		endpoint {
>> +			remote-endpoint = <&lvds0_input>;
>> +		};
>> +	};
>> +	port@2 {
>> +		endpoint {
>> +			remote-endpoint = <&lvds1_input>;
>> +		};
>> +	};
>> +};
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
>> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts index
>> cb9da1f3942b5b30..92c0509971ec3df5 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
>> @@ -7,44 +7,37 @@
>>
>>  /dts-v1/;
>>  /plugin/;
>> -/ {
>> -	fragment@0 {
>> -		target-path = "/";
>> -		__overlay__ {
>> -			#address-cells = <2>;
>> -			#size-cells = <2>;
>>
>> -			lvds@feb90000 {
>> -				compatible = "renesas,r8a7791-lvds";
>> -				reg = <0 0xfeb90000 0 0x1c>;
>> +&{/} {
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>>
>> -				ports {
>> -					#address-cells = <1>;
>> -					#size-cells = <0>;
>> +	lvds@feb90000 {
>> +		compatible = "renesas,r8a7791-lvds";
>> +		reg = <0 0xfeb90000 0 0x1c>;
>>
>> -					port@0 {
>> -						reg = <0>;
>> -						lvds0_input: endpoint {
>> -						};
>> -					};
>> -					port@1 {
>> -						reg = <1>;
>> -						lvds0_out: endpoint {
>> -						};
>> -					};
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				lvds0_input: endpoint {
>>  				};
>>  			};
>> -		};
>> -	};
>> -
>> -	fragment@1 {
>> -		target-path = "/display@feb00000/ports";
>> -		__overlay__ {
>>  			port@1 {
>> -				endpoint {
>> -					remote-endpoint = <&lvds0_input>;
>> +				reg = <1>;
>> +				lvds0_out: endpoint {
>>  				};
>>  			};
>>  		};
>>  	};
>>  };
>> +
>> +&{/display@feb00000/ports} {
>> +	port@1 {
>> +		endpoint {
>> +			remote-endpoint = <&lvds0_input>;
>> +		};
>> +	};
>> +};
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
>> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts index
>> e7b8804dc3c1a1c5..c8b93f21de0fbb8e 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
>> @@ -7,44 +7,37 @@
>>
>>  /dts-v1/;
>>  /plugin/;
>> -/ {
>> -	fragment@0 {
>> -		target-path = "/";
>> -		__overlay__ {
>> -			#address-cells = <2>;
>> -			#size-cells = <2>;
>>
>> -			lvds@feb90000 {
>> -				compatible = "renesas,r8a7793-lvds";
>> -				reg = <0 0xfeb90000 0 0x1c>;
>> +&{/} {
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>>
>> -				ports {
>> -					#address-cells = <1>;
>> -					#size-cells = <0>;
>> +	lvds@feb90000 {
>> +		compatible = "renesas,r8a7793-lvds";
>> +		reg = <0 0xfeb90000 0 0x1c>;
>>
>> -					port@0 {
>> -						reg = <0>;
>> -						lvds0_input: endpoint {
>> -						};
>> -					};
>> -					port@1 {
>> -						reg = <1>;
>> -						lvds0_out: endpoint {
>> -						};
>> -					};
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				lvds0_input: endpoint {
>>  				};
>>  			};
>> -		};
>> -	};
>> -
>> -	fragment@1 {
>> -		target-path = "/display@feb00000/ports";
>> -		__overlay__ {
>>  			port@1 {
>> -				endpoint {
>> -					remote-endpoint = <&lvds0_input>;
>> +				reg = <1>;
>> +				lvds0_out: endpoint {
>>  				};
>>  			};
>>  		};
>>  	};
>>  };
>> +
>> +&{/display@feb00000/ports} {
>> +	port@1 {
>> +		endpoint {
>> +			remote-endpoint = <&lvds0_input>;
>> +		};
>> +	};
>> +};
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
>> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts index
>> a1327443e6fa4d31..16c2d03cb016c470 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
>> @@ -7,44 +7,37 @@
>>
>>  /dts-v1/;
>>  /plugin/;
>> -/ {
>> -	fragment@0 {
>> -		target-path = "/soc";
>> -		__overlay__ {
>> -			#address-cells = <2>;
>> -			#size-cells = <2>;
>>
>> -			lvds@feb90000 {
>> -				compatible = "renesas,r8a7795-lvds";
>> -				reg = <0 0xfeb90000 0 0x14>;
>> +&{/soc} {
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>>
>> -				ports {
>> -					#address-cells = <1>;
>> -					#size-cells = <0>;
>> +	lvds@feb90000 {
>> +		compatible = "renesas,r8a7795-lvds";
>> +		reg = <0 0xfeb90000 0 0x14>;
>>
>> -					port@0 {
>> -						reg = <0>;
>> -						lvds0_input: endpoint {
>> -						};
>> -					};
>> -					port@1 {
>> -						reg = <1>;
>> -						lvds0_out: endpoint {
>> -						};
>> -					};
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				lvds0_input: endpoint {
>> +				};
>> +			};
>> +			port@1 {
>> +				reg = <1>;
>> +				lvds0_out: endpoint {
>>  				};
>>  			};
>>  		};
>>  	};
>> +};
>>
>> -	fragment@1 {
>> -		target-path = "/soc/display@feb00000/ports";
>> -		__overlay__ {
>> -			port@3 {
>> -				endpoint {
>> -					remote-endpoint = <&lvds0_input>;
>> -				};
>> -			};
>> +&{/soc/display@feb00000/ports} {
>> +	port@3 {
>> +		endpoint {
>> +			remote-endpoint = <&lvds0_input>;
>>  		};
>>  	};
>>  };
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
>> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts index
>> b23d6466c4152b6f..680e923ac036c932 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
>> @@ -7,44 +7,37 @@
>>
>>  /dts-v1/;
>>  /plugin/;
>> -/ {
>> -	fragment@0 {
>> -		target-path = "/soc";
>> -		__overlay__ {
>> -			#address-cells = <2>;
>> -			#size-cells = <2>;
>>
>> -			lvds@feb90000 {
>> -				compatible = "renesas,r8a7796-lvds";
>> -				reg = <0 0xfeb90000 0 0x14>;
>> +&{/soc} {
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>>
>> -				ports {
>> -					#address-cells = <1>;
>> -					#size-cells = <0>;
>> +	lvds@feb90000 {
>> +		compatible = "renesas,r8a7796-lvds";
>> +		reg = <0 0xfeb90000 0 0x14>;
>>
>> -					port@0 {
>> -						reg = <0>;
>> -						lvds0_input: endpoint {
>> -						};
>> -					};
>> -					port@1 {
>> -						reg = <1>;
>> -						lvds0_out: endpoint {
>> -						};
>> -					};
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				lvds0_input: endpoint {
>> +				};
>> +			};
>> +			port@1 {
>> +				reg = <1>;
>> +				lvds0_out: endpoint {
>>  				};
>>  			};
>>  		};
>>  	};
>> +};
>>
>> -	fragment@1 {
>> -		target-path = "/soc/display@feb00000/ports";
>> -		__overlay__ {
>> -			port@3 {
>> -				endpoint {
>> -					remote-endpoint = <&lvds0_input>;
>> -				};
>> -			};
>> +&{/soc/display@feb00000/ports} {
>> +	port@3 {
>> +		endpoint {
>> +			remote-endpoint = <&lvds0_input>;
>>  		};
>>  	};
>>  };
> 

