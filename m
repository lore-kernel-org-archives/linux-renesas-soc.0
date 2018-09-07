Return-Path: <openrisc-bounces@lists.librecores.org>
MIME-Version: 1.0
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 7 Sep 2018 14:54:20 +0200
Message-ID: <CAHTX3d+BFKM-jFo8Ww_dXwAzsDVoWqE==erfwVTeijHfh8kkOw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [OpenRISC] [PATCH 00/21] DT cpu node iterator
List-Unsubscribe: <https://lists.librecores.org/options/openrisc>,
 <mailto:openrisc-request@lists.librecores.org?subject=unsubscribe>
List-Archive: <http://lists.librecores.org/pipermail/openrisc/>
List-Post: <mailto:openrisc@lists.librecores.org>
List-Help: <mailto:openrisc-request@lists.librecores.org?subject=help>
List-Subscribe: <https://lists.librecores.org/listinfo/openrisc>,
 <mailto:openrisc-request@lists.librecores.org?subject=subscribe>
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-sh@vger.kernel.org,
 Vitaly Bordug <vitb@kernel.crashing.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-clk@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Mark Salter <msalter@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Ley Foon Tan <lftan@altera.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org,
 Simon Horman <horms@verge.net.au>, nios2-dev@lists.rocketboards.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: multipart/mixed; boundary="===============4062383942577974135=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>
List-ID: <linux-renesas-soc.vger.kernel.org>

--===============4062383942577974135==
Content-Type: multipart/alternative; boundary="0000000000009fa1d105754781ee"

--0000000000009fa1d105754781ee
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

2018-09-05 21:37 GMT+02:00 Rob Herring <robh@kernel.org>:

> This series adds an iterator for cpu nodes and converts users over to use
> it or of_get_cpu_node in some cases. This allows us to remove the
> dependency on device_type property for cpu nodes though removing that
> from DTS files will have to wait for some time. In some cases, this makes
> the DT search more strict by only looking in /cpus child nodes rather
> than any node with the device_type == cpu. The iterator also honors the
> status property which is often forgotten.
>
> I've only tested on ARM under QEMU and compiled powerpc.
>


Do you have this somewhere in your tree not to apply 21 patches by hand?

Thanks,
Michal

--0000000000009fa1d105754781ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Rob,<br><div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2018-09-05 21:37 GMT+02:00 Rob Herring <span dir=3D"ltr">&=
lt;<a href=3D"mailto:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>=
&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">This series adds an iterator=
 for cpu nodes and converts users over to use<br>
it or of_get_cpu_node in some cases. This allows us to remove the<br>
dependency on device_type property for cpu nodes though removing that<br>
from DTS files will have to wait for some time. In some cases, this makes<b=
r>
the DT search more strict by only looking in /cpus child nodes rather<br>
than any node with the device_type =3D=3D cpu. The iterator also honors the=
<br>
status property which is often forgotten.<br>
<br>
I&#39;ve only tested on ARM under QEMU and compiled powerpc.<br></blockquot=
e><div><br></div><div><br></div><div>Do you have this somewhere in your tre=
e not to apply 21 patches by hand?</div><div><br></div><div>Thanks,</div><d=
iv>Michal<br></div><div>=C2=A0</div></div><br></div></div></div>

--0000000000009fa1d105754781ee--

--===============4062383942577974135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============4062383942577974135==--
