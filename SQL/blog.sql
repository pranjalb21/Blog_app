-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2020 at 01:57 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `c_no` int(11) NOT NULL,
  `c_name` varchar(30) NOT NULL,
  `c_phone` varchar(10) NOT NULL,
  `c_email` varchar(50) NOT NULL,
  `c_msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`c_no`, `c_name`, `c_phone`, `c_email`, `c_msg`) VALUES
(33, 'Bapon', '6222222222', 'bapondri@gmail.com', 'HI'),
(34, 'Pranjal', '9800384120', 'pranjalgain052@gmail.com', 'Hi today is monday.'),
(35, 'Pranjal', '9800384120', 'pranjalgain052@gmail.com', 'Today\'s date is 20th July 2020');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `p_no` int(11) NOT NULL,
  `p_slug` varchar(50) NOT NULL,
  `p_title` varchar(50) NOT NULL,
  `p_content` text NOT NULL,
  `p_by` varchar(20) NOT NULL,
  `p_email` varchar(50) NOT NULL,
  `p_date` date NOT NULL,
  `p_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`p_no`, `p_slug`, `p_title`, `p_content`, `p_by`, `p_email`, `p_date`, `p_time`) VALUES
(15, '7-world-trade-center', '7 World Trade Center', '    7 World Trade Center (7 WTC) refers to two buildings that have existed at the same location within the World Trade Center site in Lower Manhattan, New York City. The original structure, part of the original World Trade Center, was completed in 1987 and was destroyed in the September 11 attacks in 2001. The current structure opened in May 2006. Both buildings were developed by Larry Silverstein, who holds a ground lease for the site from the Port Authority of New York and New Jersey.\r\n\r\nThe original 7 World Trade Center was 47 stories tall, clad in red granite masonry, and occupied a trapezoidal footprint. An elevated walkway spanning Vesey Street connected the building to the World Trade Center plaza. The building was situated above a Consolidated Edison power substation, which imposed unique structural design constraints. When the building opened in 1987, Silverstein had difficulties attracting tenants. Salomon Brothers signed a long-term lease in 1988 and became the main tenant of 7 WTC.\r\n\r\nOn September 11, 2001, the structure was substantially damaged by debris when the nearby North Tower of the World Trade Center collapsed. The debris ignited fires on multiple lower floors of the building, which continued to burn uncontrolled throughout the afternoon. The building\'s internal fire suppression system lacked water pressure to fight the fires. The collapse began when a critical internal column buckled and triggered cascading failure of nearby columns throughout, which was first visible from the exterior with the crumbling of a rooftop penthouse structure at 5:20:33 pm. This initiated progressive collapse of the entire building at 5:21:10 pm, according to FEMA,[5]:23 while the 2008 NIST study placed the final collapse time at 5:20:52 pm.The collapse made the old 7 World Trade Center the first steel skyscraper known to have collapsed primarily due to uncontrolled fires.[7][8]\r\n\r\nConstruction of the new 7 World Trade Center began in 2002 and was completed in 2006. The building is 52 stories tall (plus one underground floor), making it the 28th-tallest in New York.[2][3][4] It is built on a smaller footprint than the original, and is bounded by Greenwich, Vesey, Washington, and Barclay Streets on the east, south, west, and north, respectively. A small park across Greenwich Street occupies space that was part of the original building\'s footprint. The current building\'s design emphasizes safety, with a reinforced concrete core, wider stairways, and thicker fireproofing on steel columns. It also incorporates numerous green design features. The building was the first commercial office building in New York City to receive the U.S. Green Building Council\'s Leadership in Energy and Environmental Design (LEED) certification, where it won a gold rating. It was also one of the first projects accepted to be part of the Council\'s pilot program for Leadership in Energy and Environmental Design – Core and Shell Development (LEED-CS).    ', 'Pranjal', 'pranjalgain052@gmail.com', '2020-07-27', '22:48:48'),
(17, 'bruce-castle', 'Bruce Castle', 'Bruce Castle (formerly the Lordship House) is a Grade I listed 16th-century[1] manor house in Lordship Lane, Tottenham, London. It is named after the House of Bruce who formerly owned the land on which it is built. Believed to stand on the site of an earlier building, about which little is known, the current house is one of the oldest surviving English brick houses. It was remodelled in the 17th, 18th and 19th centuries.\r\n\r\nThe house has been home to Sir William Compton, the Barons Coleraine and Sir Rowland Hill, among others. After serving as a school during the 19th century, when a large extension was built to the west, it was converted into a museum exploring the history of the areas now constituting London Borough of Haringey and, on the strength of its connection with Sir Rowland Hill, the history of the Royal Mail. The building also houses the archives of the London Borough of Haringey. Since 1892 the grounds have been a public park, Tottenham\'s oldest.', 'Bapon', 'bapondri@gmail.com', '2020-07-27', '23:03:34'),
(18, 'capon-chapel', 'Capon Chapel', 'Capon Chapel ( /ˈkeɪpən/ KAY-pən), also historically known as Capon Baptist Chapel and Capon Chapel Church, is a mid-19th century United Methodist church located near to the town of Capon Bridge, West Virginia, in the United States. Capon Chapel is one of the oldest existing log churches in Hampshire County, along with Mount Bethel Church and Old Pine Church.\r\n\r\nA Baptist congregation was gathering at the site of the present-day church by at least 1756. Primitive Baptist minister John Monroe (1750–1824) is credited for establishing a place of worship at this site; he is interred in the church\'s cemetery. The land on which Capon Chapel was built originally belonged to William C. Nixon (1789–1869), a member of the Virginia House of Delegates; later, it was transferred to the Pugh family. The first documented mention of a church at the Capon Chapel site was in March 1852, when Joseph Pugh allocated the land to three trustees for the construction of a church and cemetery.\r\n\r\nDuring the early years of Capon Chapel, no Protestant denomination was the exclusive owner or occupant, and the church was probably utilized as a \"union church\" for worship by any Christian denomination. Capon Chapel was used as a place of worship by Baptists until the late 19th or early 20th century. In the 1890s, Capon Chapel was added as a place of worship on the Capon Bridge Methodist circuit of the Southern Methodist Episcopal Church. As of 2017, Capon Chapel remains a Methodist church, now a part of the United Methodist Church, holding Methodist services four Sundays per month at 1pm. Open table communion is held on the first Sunday of each month. Capon Chapel also maintains a daily devotion hotline.\r\n\r\nCapon Chapel\'s cemetery is surrounded by a wrought iron fence made by Stewart Iron Works, and contains the remains of John Monroe, William C. Nixon, West Virginia House of Delegates member Captain David Pugh (1806–1899), American Civil War veterans from the Union and the Confederacy, and free and enslaved African Americans. Capon Chapel, along with its cemetery, was added to the National Register of Historic Places on December 12, 2012, in recognition of its representation of the rural religious architecture of the Potomac Highlands region, and for its service as an important rural church in Hampshire County.', 'Bapon', 'bapondri@gmail.com', '2020-07-28', '10:28:00'),
(19, 'pyramid-of-neferirkare', 'Pyramid of Neferirkare', 'The Pyramid of Neferirkare (in ancient Egyptian the Ba of Neferirkare[4]) was built for the Fifth Dynasty pharaoh Neferirkare Kakai – referred to as Neferirkare – in the 25th century BC.[6][a] It was the tallest structure located on the highest site at the necropolis of Abusir – found between Giza and Saqqara – and still towers over the necropolis today. The pyramid is also significant because its evacuation led to the discovery of the Abusir papyri.\r\n\r\nThe Fifth Dynasty marked the end of the great pyramid constructions during the Old Kingdom. Pyramids of the era were smaller and becoming more standardized, though intricate relief decoration also proliferated. Neferirkare\'s pyramid deviated from convention as it was originally built as a step pyramid: a design that had been antiquated after the Third Dynasty (26th or 27th century BC).[b] This was then encased in a second step pyramid with alterations intended to convert it into a true pyramid;[c] however, the pharaoh\'s death left the work to be completed by his successors. The remaining works were completed in haste, using cheaper building material.\r\n\r\nBecause of the circumstances, Neferirkare\'s monument lacked several basic elements of a pyramid complex: a valley temple, a causeway, and a cult pyramid. Instead, these were replaced by a small settlement of mudbrick houses south of the monument from where cult priests could conduct their daily activities, rather than the usual pyramid town near the valley temple. The discovery of the Abusir papyri in the 1890s is owed to this. Normally, the papyrus archives would have been contained in the pyramid town where their destruction would have been assured. The pyramid became part of a greater family cemetery. The monuments to Neferirkare\'s consort, Khentkaus II; and his sons, Neferefre and Nyuserre Ini, are found in the surrounds. Though their construction began under different rulers, all four of these monuments were completed during the reign of Nyuserre.', 'Bapon', 'bapondri@gmail.com', '2020-07-28', '10:28:37'),
(20, 'buckingham-palace', 'Buckingham Palace', 'Buckingham Palace (UK: /ˈbʌkɪŋəm/[1][2]) is the London residence and administrative headquarters of the monarch of the United Kingdom.[a][3] Located in the City of Westminster, the palace is often at the centre of state occasions and royal hospitality. It has been a focal point for the British people at times of national rejoicing and mourning.\r\n\r\nOriginally known as Buckingham House, the building at the core of today\'s palace was a large townhouse built for the Duke of Buckingham in 1703 on a site that had been in private ownership for at least 150 years. It was acquired by King George III in 1761[4] as a private residence for Queen Charlotte and became known as The Queen\'s House. During the 19th century it was enlarged, principally by architects John Nash and Edward Blore, who constructed three wings around a central courtyard. Buckingham Palace became the London residence of the British monarch on the accession of Queen Victoria in 1837.\r\n\r\nThe last major structural additions were made in the late 19th and early 20th centuries, including the East Front, which contains the well-known balcony on which the royal family traditionally congregates to greet crowds. A German bomb destroyed the palace chapel during World War II; the Queen\'s Gallery was built on the site and opened to the public in 1962 to exhibit works of art from the Royal Collection.\r\n\r\nThe original early 19th-century interior designs, many of which survive, include widespread use of brightly coloured scagliola and blue and pink lapis, on the advice of Sir Charles Long. King Edward VII oversaw a partial redecoration in a Belle Époque cream and gold colour scheme. Many smaller reception rooms are furnished in the Chinese regency style with furniture and fittings brought from the Royal Pavilion at Brighton and from Carlton House. The palace has 775 rooms, and the garden is the largest private garden in London. The state rooms, used for official and state entertaining, are open to the public each year for most of August and September and on some days in winter and spring.', 'Bapon', 'bapondri@gmail.com', '2020-07-28', '10:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `sl_no` int(11) NOT NULL,
  `f_name` varchar(20) NOT NULL,
  `l_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`sl_no`, `f_name`, `l_name`, `email`, `phone`, `password`, `dob`) VALUES
(13, 'Pranjal', 'Gain', 'pranjalgain052@gmail.com', '9800384120', 'Pranjal@1', '1998-10-06'),
(14, 'Bapon', 'Gain', 'bapondri@gmail.com', '8116668107', 'Bapon@1', '2004-02-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`c_no`),
  ADD UNIQUE KEY `c_no` (`c_no`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`p_no`),
  ADD KEY `p_email` (`p_email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`sl_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `c_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `p_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`p_email`) REFERENCES `user` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
