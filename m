Return-Path: <SRS0=8vLU=CZ=gmail.com=cjx.private@vergenet.net>
From: Jesse Chan <jc@linux.com>
To: Simon Horman <horms@verge.net.au>, Jesse Chan <jc@linux.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>
Subject: Re: Re: [PATCH] mmc: renesas_sdhi: add missing
 MODULE_DESCRIPTION/AUTHOR/LICENSE
Date: Mon, 27 Nov 2017 11:01:31 +0000
Message-ID: 
	<MWHPR06MB2558364708C5EFCE8AAD1C0C9D250@MWHPR06MB2558.namprd06.prod.outlook.com>
References: 
	<20171120213236.53266-1-jc@linux.com>,<CAMuHMdWZuGUvK5FvwO4kkhNeir_j+13VWB-y3SSUO3s5Z6w+bA@mail.gmail.com>
In-Reply-To: 
	<CAMuHMdWZuGUvK5FvwO4kkhNeir_j+13VWB-y3SSUO3s5Z6w+bA@mail.gmail.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHPR06MB2558364708C5EFCE8AAD1C0C9D250MWHPR06MB2558namp_"
MIME-Version: 1.0
List-ID: <linux-renesas-soc.vger.kernel.org>

--_000_MWHPR06MB2558364708C5EFCE8AAD1C0C9D250MWHPR06MB2558namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I copied authors from the header of file. I will correct this in next revis=
ion of patch.

Thanks for your feedback.


Sent from Samsung Focus


-------- Original message --------
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: 11/27/17 02:16 (GMT-08:00)
To: Jesse Chan <jc@linux.com>, Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hanss=
on@linaro.org>, Linux MMC List <linux-mmc@vger.kernel.org>, linux-kernel@vg=
er.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-re=
nesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: renesas_sdhi: add missing MODULE_DESCRIPTION/AUTH=
OR/LICENSE

Hi Jesse,

On Mon, Nov 20, 2017 at 10:32 PM, Jesse Chan <jc@linux.com> wrote:
> This change resolves a new compile-time warning
> when built as a loadable module:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/mmc/host/renesas_sd=
hi_core.o
> see include/linux/module.h for more information
>
> This adds the license as "GPL v2", which matches the header of the file.
>
> MODULE_DESCRIPTION and MODULE_AUTHOR are also added.
>
> Signed-off-by: Jesse Chan <jc@linux.com>
> ---
>  drivers/mmc/host/renesas_sdhi.h               | 1 +
>  drivers/mmc/host/renesas_sdhi_core.c          | 5 +++++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 -
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 1 -
>  4 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h
> index b9dfea5d8193..090cf86d7cd3 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -13,6 +13,7 @@
>  #define RENESAS_SDHI_H
>
>  #include <linux/platform_device.h>
> +#include <linux/module.h>
>  #include "tmio_mmc.h"
>
>  struct renesas_sdhi_scc {
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index fcf7235d5742..0a0daa7a342f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -667,3 +667,8 @@ int renesas_sdhi_remove(struct platform_device *pdev)
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(renesas_sdhi_remove);
> +
> +MODULE_DESCRIPTION("Renesas SDHI driver");
> +MODULE_AUTHOR("Phil Blundell <pb@handhelds.org>");
> +MODULE_AUTHOR("Samuel Ortiz <sameo@openedhand.com>");
> +MODULE_LICENSE("GPL v2");

This doesn't look right to me. Before commit 9d08428afb722fed ("mmc:
renesas-sdhi: make renesas_sdhi_sys_dmac main module file"), the file had:

     MODULE_AUTHOR("Magnus Damm");
     MODULE_LICENSE("GPL v2");

> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/=
host/renesas_sdhi_internal_dmac.c
> index 41cbe84c1d18..a9b452b42fac 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -15,7 +15,6 @@
>  #include <linux/mfd/tmio.h>
>  #include <linux/mmc/host.h>
>  #include <linux/mod_devicetable.h>
> -#include <linux/module.h>
>  #include <linux/pagemap.h>
>  #include <linux/scatterlist.h>
>  #include <linux/sys_soc.h>
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/=
renesas_sdhi_sys_dmac.c
> index 9ab10436e4b8..fe6a09f14682 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -17,7 +17,6 @@
>  #include <linux/mfd/tmio.h>
>  #include <linux/mmc/host.h>
>  #include <linux/mod_devicetable.h>
> -#include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/pagemap.h>
>  #include <linux/scatterlist.h>
> --
> 2.14.1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

--_000_MWHPR06MB2558364708C5EFCE8AAD1C0C9D250MWHPR06MB2558namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div>I copied authors from the header of file. I will correct this in next =
revision of patch.
<br>
<br>
Thanks for your feedback. </div>
<br>
<br>
<div style=3D"font-size:75%; color:#252525">Sent from Samsung Focus</div>
<br>
<br>
<div>-------- Original message --------</div>
<div>From: Geert Uytterhoeven &lt;geert@linux-m68k.org&gt; </div>
<div>Date: 11/27/17 02:16 (GMT-08:00) </div>
<div>To: Jesse Chan &lt;jc@linux.com&gt;, Simon Horman &lt;horms@verge.net.=
au&gt; </div>
<div>Cc: Wolfram Sang &lt;wsa&#43;renesas@sang-engineering.com&gt;, Ulf Han=
sson &lt;ulf.hansson@linaro.org&gt;, Linux MMC List &lt;linux-mmc@vger.kern=
el.org&gt;, linux-kernel@vger.kernel.org, Magnus Damm &lt;magnus.damm@gmail=
.com&gt;, Linux-Renesas &lt;linux-renesas-soc@vger.kernel.org&gt;
</div>
<div>Subject: Re: [PATCH] mmc: renesas_sdhi: add missing MODULE_DESCRIPTION=
/AUTHOR/LICENSE
</div>
<div><br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi Jesse,<br>
<br>
On Mon, Nov 20, 2017 at 10:32 PM, Jesse Chan &lt;jc@linux.com&gt; wrote:<br=
>
&gt; This change resolves a new compile-time warning<br>
&gt; when built as a loadable module:<br>
&gt;<br>
&gt; WARNING: modpost: missing MODULE_LICENSE() in drivers/mmc/host/renesas=
_sdhi_core.o<br>
&gt; see include/linux/module.h for more information<br>
&gt;<br>
&gt; This adds the license as &quot;GPL v2&quot;, which matches the header =
of the file.<br>
&gt;<br>
&gt; MODULE_DESCRIPTION and MODULE_AUTHOR are also added.<br>
&gt;<br>
&gt; Signed-off-by: Jesse Chan &lt;jc@linux.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/mmc/host/renesas_sdhi.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<br>
&gt;&nbsp; drivers/mmc/host/renesas_sdhi_core.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 5 &#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 -<br>
&gt;&nbsp; drivers/mmc/host/renesas_sdhi_sys_dmac.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 1 -<br>
&gt;&nbsp; 4 files changed, 6 insertions(&#43;), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesa=
s_sdhi.h<br>
&gt; index b9dfea5d8193..090cf86d7cd3 100644<br>
&gt; --- a/drivers/mmc/host/renesas_sdhi.h<br>
&gt; &#43;&#43;&#43; b/drivers/mmc/host/renesas_sdhi.h<br>
&gt; @@ -13,6 &#43;13,7 @@<br>
&gt;&nbsp; #define RENESAS_SDHI_H<br>
&gt;<br>
&gt;&nbsp; #include &lt;linux/platform_device.h&gt;<br>
&gt; &#43;#include &lt;linux/module.h&gt;<br>
&gt;&nbsp; #include &quot;tmio_mmc.h&quot;<br>
&gt;<br>
&gt;&nbsp; struct renesas_sdhi_scc {<br>
&gt; diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/r=
enesas_sdhi_core.c<br>
&gt; index fcf7235d5742..0a0daa7a342f 100644<br>
&gt; --- a/drivers/mmc/host/renesas_sdhi_core.c<br>
&gt; &#43;&#43;&#43; b/drivers/mmc/host/renesas_sdhi_core.c<br>
&gt; @@ -667,3 &#43;667,8 @@ int renesas_sdhi_remove(struct platform_device=
 *pdev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp; }<br>
&gt;&nbsp; EXPORT_SYMBOL_GPL(renesas_sdhi_remove);<br>
&gt; &#43;<br>
&gt; &#43;MODULE_DESCRIPTION(&quot;Renesas SDHI driver&quot;);<br>
&gt; &#43;MODULE_AUTHOR(&quot;Phil Blundell &lt;pb@handhelds.org&gt;&quot;)=
;<br>
&gt; &#43;MODULE_AUTHOR(&quot;Samuel Ortiz &lt;sameo@openedhand.com&gt;&quo=
t;);<br>
&gt; &#43;MODULE_LICENSE(&quot;GPL v2&quot;);<br>
<br>
This doesn't look right to me. Before commit 9d08428afb722fed (&quot;mmc:<b=
r>
renesas-sdhi: make renesas_sdhi_sys_dmac main module file&quot;), the file =
had:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; MODULE_AUTHOR(&quot;Magnus Damm&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp; MODULE_LICENSE(&quot;GPL v2&quot;);<br>
<br>
&gt; diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/m=
mc/host/renesas_sdhi_internal_dmac.c<br>
&gt; index 41cbe84c1d18..a9b452b42fac 100644<br>
&gt; --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c<br>
&gt; &#43;&#43;&#43; b/drivers/mmc/host/renesas_sdhi_internal_dmac.c<br>
&gt; @@ -15,7 &#43;15,6 @@<br>
&gt;&nbsp; #include &lt;linux/mfd/tmio.h&gt;<br>
&gt;&nbsp; #include &lt;linux/mmc/host.h&gt;<br>
&gt;&nbsp; #include &lt;linux/mod_devicetable.h&gt;<br>
&gt; -#include &lt;linux/module.h&gt;<br>
&gt;&nbsp; #include &lt;linux/pagemap.h&gt;<br>
&gt;&nbsp; #include &lt;linux/scatterlist.h&gt;<br>
&gt;&nbsp; #include &lt;linux/sys_soc.h&gt;<br>
&gt; diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/ho=
st/renesas_sdhi_sys_dmac.c<br>
&gt; index 9ab10436e4b8..fe6a09f14682 100644<br>
&gt; --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c<br>
&gt; &#43;&#43;&#43; b/drivers/mmc/host/renesas_sdhi_sys_dmac.c<br>
&gt; @@ -17,7 &#43;17,6 @@<br>
&gt;&nbsp; #include &lt;linux/mfd/tmio.h&gt;<br>
&gt;&nbsp; #include &lt;linux/mmc/host.h&gt;<br>
&gt;&nbsp; #include &lt;linux/mod_devicetable.h&gt;<br>
&gt; -#include &lt;linux/module.h&gt;<br>
&gt;&nbsp; #include &lt;linux/of_device.h&gt;<br>
&gt;&nbsp; #include &lt;linux/pagemap.h&gt;<br>
&gt;&nbsp; #include &lt;linux/scatterlist.h&gt;<br>
&gt; --<br>
&gt; 2.14.1<br>
<br>
Gr{oetje,eeting}s,<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Geert<br>
<br>
--<br>
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org<br>
<br>
In personal conversations with technical people, I call myself a hacker. Bu=
t<br>
when I'm talking to journalists I just say &quot;programmer&quot; or someth=
ing like that.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Linus Torvalds<br>
</div>
</span></font>
</body>
</html>

--_000_MWHPR06MB2558364708C5EFCE8AAD1C0C9D250MWHPR06MB2558namp_--
