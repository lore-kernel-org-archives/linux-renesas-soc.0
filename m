Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v2] phy: rcar-gen3-usb2, rcar-gen2: Use ARCH_RENESAS
To: Simon Horman <horms@verge.net.au>,
	Geert Uytterhoeven <geert@linux-m68k.org>
References: <1457313264-18476-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXqvp4+uQzLCPpj7r29bM0__O1j5-aQ_uQ9u0-XSrC3Rw@mail.gmail.com>
 <20160325021207.GC31681@verge.net.au>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <57231B7C.9060307@ti.com>
Date: Fri, 29 Apr 2016 13:59:48 +0530
MIME-Version: 1.0
In-Reply-To: <20160325021207.GC31681@verge.net.au>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On Friday 25 March 2016 07:42 AM, Simon Horman wrote:
> On Mon, Mar 07, 2016 at 09:01:48AM +0100, Geert Uytterhoeven wrote:
>> On Mon, Mar 7, 2016 at 2:14 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
>>> Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.
>>> A now redundant dependency on OF is also dropped.
>>>
>>> This is part of an ongoing process to migrate from ARCH_SHMOBILE to
>>> ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
>>> appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
>>>
>>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>>> Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>
>> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Hi Kishon,
> 
> I am wondering if you could consider applying this series too.

merged now.

Thanks
Kishon

> 
> Thanks in advance!
> 
