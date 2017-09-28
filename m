Return-Path: <linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org>
Date: Thu, 28 Sep 2017 15:09:21 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: Re: [PATCH v2 13/17] media: v4l2-async: simplify v4l2_async_subdev
 structure
Message-ID: <20170928120920.ywgbtikkrts25qlj@valkosipuli.retiisi.org.uk>
References: <cover.1506548682.git.mchehab@s-opensource.com>
 <cd089c6dac22c8ea2194c47c48386e52bb6e561f.1506548682.git.mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd089c6dac22c8ea2194c47c48386e52bb6e561f.1506548682.git.mchehab@s-opensource.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Songjun Wu <songjun.wu@microchip.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Javi Merino <javi.merino@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Markus Elfring <elfring@users.sourceforge.net>, devel@driverdev.osuosl.org,
 Yannick Fertre <yannick.fertre@st.com>, linux-samsung-soc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kukjin Kim <kgene@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>,
 Tuukka Toivonen <tuukka.toivonen@intel.com>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh@kernel.org>,
 linux-renesas-soc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Benoit Parrot <bparrot@ti.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, Hugues Fruchet <hugues.fruchet@st.com>,
 Petr Cvek <petr.cvek@tul.cz>,
 =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
 linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomasz Figa <tfiga@chromium.org>, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 "Gustavo A. R. Silva" <garsilva@embeddedor.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mauro,

On Wed, Sep 27, 2017 at 06:46:56PM -0300, Mauro Carvalho Chehab wrote:
> The V4L2_ASYNC_MATCH_FWNODE match criteria requires just one
> struct to be filled (struct fwnode_handle). The V4L2_ASYNC_MATCH_DEVNAME
> match criteria requires just a device name.
> 
> So, it doesn't make sense to enclose those into structs,
> as the criteria can go directly into the union.
> 
> That makes easier to document it, as we don't need to document
> weird senseless structs.

The idea is that in the union, there's a struct which is specific to the
match_type field. I wouldn't call it senseless.

In the two cases there's just a single field in the containing struct. You
could remove the struct in that case as you do in this patch, and just use
the field. But I think the result is less clean and so I wouldn't make this
change.

The confusion comes possibly from the fact that the struct is named the
same as the field in the struct. These used to be called of and node, but
with the fwnode property framework the references to the fwnode are, well,
typically similarly called "fwnode". There's no underlying firmware
interface with that name, fwnode property API is just an API.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
