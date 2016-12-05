Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 11/22] drm: bridge: dw-hdmi: Refactor hdmi_phy_configure
 resolution parameter
To: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480635817-1258-12-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20161202141808.GC14217@n2100.armlinux.org.uk>
Cc: dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 Archit Taneja <architt@codeaurora.org>,
 Fabio Estevam <fabio.estevam@freescale.com>, Heiko Stuebner
 <heiko@sntech.de>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Mark Yao <mark.yao@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ulrich Hecht <ulrich.hecht@gmail.com>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
 linux-renesas-soc@vger.kernel.org
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <56d93a5d-ba00-254c-2a8c-31d468ca8457@ideasonboard.com>
Date: Mon, 5 Dec 2016 07:53:11 +0000
MIME-Version: 1.0
In-Reply-To: <20161202141808.GC14217@n2100.armlinux.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/12/16 14:18, Russell King - ARM Linux wrote:
> On Fri, Dec 02, 2016 at 01:43:26AM +0200, Laurent Pinchart wrote:
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> The current code hard codes the call of hdmi_phy_configure() to be 8bpp
>> and provides extraneous error checking to verify that this hardcoded
>> value is correct.
>>
>> Simplify the passing of the data by setting the parameter to be of the
>> enum type it represents rather than converting and then verifying the
>> value. This will allow the compiler to check the value is acceptable
>> based on the type, and remove the dead code that we currently have.
> 
> I think you're expecting too much of the compiler there.  There's no
> requirement for the compiler to check that an enum type is passed one
> of it's defined values.
> 
> Try building this and see if it even produces a warning:
> 
> enum foo {
> 	FOO_1,
> 	FOO_2,
> };
> 
> int func(enum foo foo)
> {
> 	return foo;
> }
> 
> int test_1(void)
> {
> 	return func(FOO_1);
> }
> 
> int test_2(void)
> {
> 	return func(5);
> }
> 

Ahh, yes - Sorry - I appear to have got confused between the effects of
gcc/g++.

I knew I had it in my head that the compiler can do enum-type checking
... but it was from when I was working on  C++ projects.

gcc /tmp/test.c -o /tmp/test
	<no stderr output>

g++     /tmp/test.cpp   -o /tmp/test
/tmp/test.cpp: In function �int test_2()�:
/tmp/test.cpp:23:16: error: invalid conversion from �int� to �foo�
[-fpermissive]
   return func(5);

C++ will provide type checking on enums, but of course not C.

Sorry for the confusion, and it looks like Laurent is handling this
already, Thanks


Regards
--
Kieran Bingham
